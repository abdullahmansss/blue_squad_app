import 'package:blue_squad_app/layout/social/cubit/cubit.dart';
import 'package:blue_squad_app/layout/social/cubit/states.dart';
import 'package:blue_squad_app/models/social/user_model.dart';
import 'package:blue_squad_app/modules/social/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              SocialCubit.get(context).users.length > 0,
          fallbackBuilder: (context) => Center(
            child: CupertinoActivityIndicator(),
          ),
          widgetBuilder: (context) => ListView.separated(
            itemBuilder: (context, index) => UserItem(
              userModel: SocialCubit.get(context).users[index],
            ),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: SocialCubit.get(context).users.length,
          ),
        );
      },
    );
  }
}

class UserItem extends StatelessWidget {
  UserModel userModel;

  UserItem({
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              userModel: userModel,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.red,
              backgroundImage: NetworkImage(
                userModel.image!,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.name!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  userModel.phone!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
