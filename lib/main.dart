import 'package:blue_squad_app/counter/cubit/cubit.dart';
import 'package:blue_squad_app/layout/shop/cubit/cubit.dart';
import 'package:blue_squad_app/layout/shop/shop_layout.dart';
import 'package:blue_squad_app/layout/social/cubit/cubit.dart';
import 'package:blue_squad_app/layout/social/social_layout.dart';
import 'package:blue_squad_app/layout/todo/cubit/cubit.dart';
import 'package:blue_squad_app/modules/shop/login/login_screen.dart';
import 'package:blue_squad_app/modules/social/login/login_screen.dart';
import 'package:blue_squad_app/shared/bloc_observer.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:blue_squad_app/shared/constants.dart';
import 'package:blue_squad_app/shared/network/local/cache_helper.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp().then((value) {
    print('Firebase Initialized Successfully');
  }).catchError((error){
    print('Firebase Initialized Error => ${error.toString()}');
  });

  DioHelper.init();
  await CacheHelper.init();
  user = FirebaseAuth.instance.currentUser;

  if(user != null) print(user!.uid);

  token = CacheHelper.getData(key: 'userToken');

  runApp(
    MyApp(
      token: token,
      user: user,
    ),
  );
}

// 1. state less widget
// 2. state full widget

class MyApp extends StatelessWidget {
  String? token;
  User? user;

  MyApp({
    this.token,
    this.user,
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
        BlocProvider(
          create: (BuildContext context) => SocialCubit()..getUserDataRealTime(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: user != null ? SocialLayout() : SocialLoginScreen(),
      ),
    );
  }
}
