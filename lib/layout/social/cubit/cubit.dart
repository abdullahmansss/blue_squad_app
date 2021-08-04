import 'dart:io';

import 'package:blue_squad_app/layout/social/cubit/states.dart';
import 'package:blue_squad_app/models/social/user_model.dart';
import 'package:blue_squad_app/modules/social/settings/settings_screen.dart';
import 'package:blue_squad_app/modules/social/users/users_screen.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data()!);

      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState());
    });
  }

  void getUserDataRealTime() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen((value) {
      userModel = UserModel.fromMap(value.data()!);

      emit(SocialGetUserSuccessState());
    });
  }

  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  void pickImage() {
    picker.pickImage(source: ImageSource.gallery).then((value) {
      imageFile = value;
      print(imageFile!.path);
      uploadProfileImage();
      emit(SocialPickImageState());
    });
  }

  // data/user/0/blue.squad.blue_squad_app/cache/image_picker7115717754331623807.jpg

  void uploadProfileImage() {
    emit(SocialUploadProfileImageLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageFile!.path).pathSegments.last}')
        .putFile(File(imageFile!.path))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateUserData(value);
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void updateUserData(String imageUrl) {
    userModel!.image = imageUrl;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update(userModel!.toMap())
        .then((value) {
      emit(SocialUpdateUserSuccessState());
    }).catchError((error) {
      emit(SocialUpdateUserErrorState());
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    UsersScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(SocialChangeBottomBarState());
  }

  List<UserModel> users = [];

  void getUsers() {
    emit(SocialGetUsersLoadingState());

    FirebaseFirestore.instance.collection('users')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            UserModel userModel = UserModel.fromMap(element.data());
            if(userModel.uId != user!.uid)
              users.add(userModel);
          });
      emit(SocialGetUsersSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUsersErrorState());
    });
  }
}
