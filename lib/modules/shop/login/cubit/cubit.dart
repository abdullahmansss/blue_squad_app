import 'package:blue_squad_app/models/shop/shop_user_model.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/shared/network/end_points.dart';
import 'package:blue_squad_app/shared/network/local/cache_helper.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<LoginStates> {
  ShopLoginCubit() : super(LoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  late ShopUserModel userModel;
  
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      userModel = ShopUserModel.fromMap(value.data);

      if(userModel.status)
      {
        print(userModel.status);
        print(userModel.message);
        print(userModel.data?.name);
        print(userModel.data?.id);

        CacheHelper.putData(key: 'userToken', value: userModel.data?.token);

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