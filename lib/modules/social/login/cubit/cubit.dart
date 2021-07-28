import 'package:blue_squad_app/models/shop/shop_user_model.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/login/cubit/states.dart';
import 'package:blue_squad_app/shared/network/end_points.dart';
import 'package:blue_squad_app/shared/network/local/cache_helper.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);
      emit(SocialLoginSuccessState());
    })
        .catchError((error) {
      print('User Login Error => ${error.toString()}');
      emit(SocialLoginErrorState());
    });
  }

  GoogleSignInAccount? googleUser;
  GoogleSignInAuthentication? googleAuth;

  void googleSignIn() {
    GoogleSignIn().signOut().then((value) async {
      googleUser = await GoogleSignIn().signIn();

      googleAuth = await googleUser!.authentication;

      print(googleAuth!.accessToken);
      print(googleAuth!.idToken);

      OAuthCredential? credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth!.idToken,
      );

      FirebaseAuth.instance.signInWithCredential(credential)
          .then((value) {
        print(value.user!.uid);
        print(value.user!.email);
        emit(SocialLoginSuccessState());
      })
          .catchError((error) {
        print('User Login Error => ${error.toString()}');
        emit(SocialLoginErrorState());
      });
    });
  }

  void facebookSignIn()  {
    FacebookAuth.instance.logOut().then((value) async {
      LoginResult? result = await FacebookAuth.instance.login();

      OAuthCredential? facebookAuthCredential = FacebookAuthProvider.credential(
          result.accessToken!.token
      );

      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)
          .then((value) {
        print(value.user!.uid);
        print(value.user!.email);
        emit(SocialLoginSuccessState());
      })
          .catchError((error) {
        print('User Login Error => ${error.toString()}');
        emit(SocialLoginErrorState());
      });
    });
  }
}