import 'package:blue_squad_app/models/shop/shop_user_model.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<LoginStates> {
  ShopLoginCubit() : super(LoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopUserModel userModel;
  
  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData({
      'email': email,
      'password': password,
    }).then((value) {
      userModel = ShopUserModel.fromMap(value.data);

      if(userModel.status)
      {
        print(userModel.status);
        print(userModel.message);
        print(userModel.data.name);
        print(userModel.data.id);
        emit(LoginSuccessState());
      } else
        {
          print(userModel.status);
          print(userModel.message);
          emit(LoginSuccessState());
        }
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }
}