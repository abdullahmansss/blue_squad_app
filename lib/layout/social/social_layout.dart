import 'dart:io';

import 'package:blue_squad_app/layout/social/cubit/cubit.dart';
import 'package:blue_squad_app/layout/social/cubit/states.dart';
import 'package:blue_squad_app/main.dart';
import 'package:blue_squad_app/models/social/user_model.dart';
import 'package:blue_squad_app/modules/social/chat/chat_screen.dart';
import 'package:blue_squad_app/modules/social/login/login_screen.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) {
      print('message received');
      print(event.data.toString());
      navigateTo(
        context: context,
        widget: ChatScreen(
          userModel: UserModel(
            uId: event.data['id'],
            name: event.data['name'],
            image: event.data['image'],
          ),
        ),
      );
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('App Opened');
      print(event.data.toString());
      navigateTo(
        context: context,
        widget: ChatScreen(
          userModel: UserModel(
            uId: event.data['id'],
            name: event.data['name'],
            image: event.data['image'],
          ),
        ),
      );
    });

    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SocialCubit.get(context).screens[SocialCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: SocialCubit.get(context).currentIndex,
            onTap: (int i){
              SocialCubit.get(context).changeIndex(i);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
