import 'package:blue_squad_app/layout/shop/shop_layout.dart';
import 'package:blue_squad_app/layout/social/social_layout.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/cubit.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/login/cubit/cubit.dart';
import 'package:blue_squad_app/modules/social/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/register/register_screen.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:blue_squad_app/shared/components/default_button.dart';
import 'package:blue_squad_app/shared/components/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class SocialLoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginSuccessState) {
            navigateAndFinish(
              context: context,
              widget: SocialLayout(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Login now to connect with friends',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  DefaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email Address',
                    prefix: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock_outline,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (state is! LoginLoadingState)
                    DefaultButton(
                      function: () {
                        SocialLoginCubit.get(context).userLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                      text: 'login',
                    ),
                  if (state is LoginLoadingState)
                    Center(child: CircularProgressIndicator()),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          SocialLoginCubit.get(context).googleSignIn();
                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: HexColor('FE5656'),
                          child: Icon(
                              FontAwesomeIcons.google,
                            size: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      GestureDetector(
                        onTap: (){
                          SocialLoginCubit.get(context).facebookSignIn();
                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                              FontAwesomeIcons.facebookF,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SocialRegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'REGISTER',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
