import 'package:blue_squad_app/models/shop/shop_user_model.dart';
import 'package:blue_squad_app/models/social/user_model.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/register/cubit/states.dart';
import 'package:blue_squad_app/shared/network/end_points.dart';
import 'package:blue_squad_app/shared/network/local/cache_helper.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void userRegister() {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
        .then((value) {
          print(value.user!.uid);
          print(value.user!.email);
          //value.user!.sendEmailVerification();
          setUserData(
            uId: value.user!.uid,
          );
          emit(SocialRegisterSuccessState());
    })
        .catchError((error) {
          print('User Authentication Error => ${error.toString()}');
      emit(SocialRegisterErrorState());
    });
  }

  void setUserData({
    required String uId,
  }) {
    emit(SocialSetUserDataLoadingState());

    UserModel userModel = UserModel(
      uId: uId,
      name: nameController.text,
      address: addressController.text,
      phone: mobileController.text,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(SocialSetUserDataSuccessState());
    })
        .catchError((error){
          print(error.toString());
      emit(SocialSetUserDataErrorState());
    });
  }
}
