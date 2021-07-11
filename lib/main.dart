import 'package:blue_squad_app/counter/cubit/cubit.dart';
import 'package:blue_squad_app/layout/shop/cubit/cubit.dart';
import 'package:blue_squad_app/layout/shop/shop_layout.dart';
import 'package:blue_squad_app/layout/todo/cubit/cubit.dart';
import 'package:blue_squad_app/modules/shop/login/login_screen.dart';
import 'package:blue_squad_app/shared/bloc_observer.dart';
import 'package:blue_squad_app/shared/constants.dart';
import 'package:blue_squad_app/shared/network/local/cache_helper.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();

  token = CacheHelper.getData(key: 'userToken');

  runApp(
    MyApp(
      token: token,
    ),
  );
}

// 1. state less widget
// 2. state full widget

class MyApp extends StatelessWidget {
  String? token;

  MyApp({
    this.token,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TodoCubit()..openOurDatabase(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token == null ? LoginScreen() : ShopLayout(),
      ),
    );
  }
}
