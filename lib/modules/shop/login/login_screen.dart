import 'package:blue_squad_app/modules/shop/login/cubit/cubit.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/shared/components/default_button.dart';
import 'package:blue_squad_app/shared/components/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, LoginStates>(
        listener: (context, state) {},
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
                    'Login now to browse our hot offers',
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
                  if(state is! LoginLoadingState)
                    DefaultButton(
                    function: () {
                      ShopLoginCubit.get(context).userLogin(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                    text: 'login',
                  ),
                  if(state is LoginLoadingState)
                    Center(child: CircularProgressIndicator()),
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
                        onPressed: () {},
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
