import 'dart:developer';

import 'package:blue_squad_app/layout/shop/cubit/states.dart';
import 'package:blue_squad_app/models/shop/shop_categories_model.dart';
import 'package:blue_squad_app/models/shop/shop_favorites_model.dart';
import 'package:blue_squad_app/models/shop/shop_home_model.dart';
import 'package:blue_squad_app/models/shop/shop_simple_model.dart';
import 'package:blue_squad_app/modules/shop/categories/shop_categories_screen.dart';
import 'package:blue_squad_app/modules/shop/favorites/shop_favorites_screen.dart';
import 'package:blue_squad_app/modules/shop/home/shop_home_screen.dart';
import 'package:blue_squad_app/modules/shop/settings/shop_settings_screen.dart';
import 'package:blue_squad_app/shared/constants.dart';
import 'package:blue_squad_app/shared/network/end_points.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  Map<int, bool> favoritesList = {};

  ShopHomeModel? shopHomeModel;

  void getHomeData() {
    print(token);
    emit(ShopGetHomeLoadingState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      shopHomeModel = ShopHomeModel.fromMap(value.data);

      shopHomeModel!.data!.products.forEach((element) {
        favoritesList.addAll({
          element.id:element.inFavorites,
        });
      });

      print(shopHomeModel?.data?.banners[0].image);
      emit(ShopGetHomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetHomeErrorState());
    });
  }

  ShopCategoriesModel? shopCategoriesModel;

  void getCategoriesData() {
    emit(ShopGetCategoriesLoadingState());
    DioHelper.getData(
      url: CATEGORIES,
    ).then((value) {
      shopCategoriesModel = ShopCategoriesModel.fromMap(value.data);

      emit(ShopGetCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetCategoriesErrorState());
    });
  }

  ShopFavoritesModel? shopFavoritesModel;

  void getFavoritesData() {
    emit(ShopGetFavoritesLoadingState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      shopFavoritesModel = ShopFavoritesModel.fromMap(value.data);

      emit(ShopGetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetFavoritesErrorState());
    });
  }

  ShopSimpleModel? simpleModel;

  void changeFavoritesData(int id) {
    favoritesList[id] = !favoritesList[id]!;

    emit(ShopChangeFavoritesLoadingState());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id':id,
      },
      token: token,
    ).then((value) {
      simpleModel = ShopSimpleModel.fromMap(value.data);
      log(simpleModel!.message);

      emit(ShopChangeFavoritesSuccessState());

      if(!simpleModel!.status)
      {
        favoritesList[id] = !favoritesList[id]!;
      } else
        {
          getFavoritesData();
        }
    }).catchError((error) {
      print(error.toString());

      favoritesList[id] = !favoritesList[id]!;

      emit(ShopChangeFavoritesErrorState());
    });
  }

  List<Widget> widgets = [
    ShopHomeScreen(),
    ShopCategoriesScreen(),
    ShopFavoritesScreen(),
    ShopSettingsScreen(),
  ];

  int index = 0;

  void changeBottomBarIndex(int index)
  {
    this.index = index;
    emit(ShopChangeBottomBarState());
  }
}
