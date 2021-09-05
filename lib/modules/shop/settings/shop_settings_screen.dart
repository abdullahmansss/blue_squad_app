import 'package:blue_squad_app/modules/shop/login/login_screen.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:blue_squad_app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

class ShopSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        CacheHelper.removeData(
          key: 'userToken',
        ).then((value) {
          navigateTo(
            context: context,
            widget: LoginScreen(),
          );
        });
      },
      child: Text(
        'logout',
      ),
    );
  }
}
