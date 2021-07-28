import 'package:blue_squad_app/layout/social/cubit/cubit.dart';
import 'package:blue_squad_app/layout/social/cubit/states.dart';
import 'package:blue_squad_app/modules/social/login/login_screen.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class SocialLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit, SocialStates>(
     listener: (context, state) {},
     builder: (context, state) {
       return Scaffold(
         appBar: AppBar(),
         body: Conditional.single(
           context: context,
           conditionBuilder: (context) => SocialCubit.get(context).userModel != null,
           widgetBuilder: (context) => Container(
             width: double.infinity,
             child: Column(
               mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   '${SocialCubit.get(context).userModel!.name} '
                       '\n ${SocialCubit.get(context).userModel!.uId} '
                       '\n ${SocialCubit.get(context).userModel!.phone} '
                       '\n ${SocialCubit.get(context).userModel!.address}',
                   style: TextStyle(
                     fontSize: 30.0,
                   ),
                 ),
                 SizedBox(
                   height: 20.0,
                 ),
                 TextButton(
                   onPressed: (){
                     FirebaseAuth.instance.signOut().then((value) {
                       navigateAndFinish(
                         context: context,
                         widget: SocialLoginScreen(),
                       );
                     });
                   },
                   child: Text(
                     'logout',
                   ),
                 ),
               ],
             ),
           ),
           fallbackBuilder: (context) => Center(child: CupertinoActivityIndicator()),
         ),
       );
     },
    );
  }
}
