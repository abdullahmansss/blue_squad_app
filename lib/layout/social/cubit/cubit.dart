import 'package:blue_squad_app/layout/social/cubit/states.dart';
import 'package:blue_squad_app/models/social/user_model.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialCubit extends Cubit<SocialStates>{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData(){
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data()!);

      emit(SocialGetUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
      emit(SocialGetUserErrorState());
    });
  }

  void getUserDataRealTime(){
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
}