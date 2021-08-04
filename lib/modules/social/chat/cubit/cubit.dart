import 'package:blue_squad_app/models/shop/shop_user_model.dart';
import 'package:blue_squad_app/models/social/message_model.dart';
import 'package:blue_squad_app/models/social/user_model.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/chat/cubit/states.dart';
import 'package:blue_squad_app/modules/social/login/cubit/states.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:blue_squad_app/shared/network/end_points.dart';
import 'package:blue_squad_app/shared/network/local/cache_helper.dart';
import 'package:blue_squad_app/shared/network/remote/dio_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialChatCubit extends Cubit<SocialChatStates> {
  SocialChatCubit() : super(SocialChatInitialState());

  static SocialChatCubit get(context) => BlocProvider.of(context);

  TextEditingController messageController = TextEditingController();

  void sendMessage({
    required UserModel userModel,
  }) {
    emit(SocialSendChatLoadingState());


    MessageModel messageModel = MessageModel(
      receiverUId: userModel.uId,
      senderUId: user!.uid,
      text: messageController.text,
      time: DateTime.now().toString(),
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('chats')
        .doc(userModel.uId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      //emit(SocialSendChatSuccessState());
      saveMessage(
        messageId: value.id,
        messageModel: messageModel,
        userModel: userModel,
      );
    }).catchError((error) {
      print(error.toString());
      emit(SocialSendChatErrorState());
    });
  }

  void saveMessage({
    required UserModel userModel,
    required MessageModel messageModel,
    required String messageId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(user!.uid)
        .collection('messages')
        .doc(messageId)
        .set(messageModel.toMap())
        .then((value) {
      emit(SocialSendChatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialSendChatErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required UserModel userModel,
  }) {
    emit(SocialChatLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('chats')
        .doc(userModel.uId)
        .collection('messages')
        .orderBy('time', descending: false,)
        .snapshots()
        .listen((event) {
      messages = [];

      event.docs.forEach((element) {
        messages.add(MessageModel.fromMap(element.data()));
      });
      emit(SocialChatSuccessState());
    });
  }
}
