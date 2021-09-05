import 'package:blue_squad_app/layout/shop/shop_layout.dart';
import 'package:blue_squad_app/layout/social/social_layout.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/cubit.dart';
import 'package:blue_squad_app/modules/shop/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/login/cubit/cubit.dart';
import 'package:blue_squad_app/modules/social/login/cubit/states.dart';
import 'package:blue_squad_app/modules/social/register/cubit/cubit.dart';
import 'package:blue_squad_app/modules/social/register/cubit/states.dart';
import 'package:blue_squad_app/shared/components/conponents.dart';
import 'package:blue_squad_app/shared/components/default_button.dart';
import 'package:blue_squad_app/shared/components/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (context, state) {
          if(state is SocialSetUserDataSuccessState){
            navigateAndFinish(
              context: context,
              widget: SocialLayout(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Register now to connect with friends',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    DefaultFormField(
                      controller: SocialRegisterCubit.get(context).emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaultFormField(
                      controller: SocialRegisterCubit.get(context).passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      prefix: Icons.lock_outline,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaultFormField(
                      controller: SocialRegisterCubit.get(context).nameController,
                      type: TextInputType.name,
                      label: 'Full Name',
                      prefix: Icons.person,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaultFormField(
                      controller: SocialRegisterCubit.get(context).mobileController,
                      type: TextInputType.phone,
                      label: 'Mobile Number',
                      prefix: Icons.phone,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaultFormField(
                      controller: SocialRegisterCubit.get(context).addressController,
                      type: TextInputType.streetAddress,
                      label: 'Address',
                      prefix: Icons.location_city,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if (state is! SocialRegisterLoadingState)
                      DefaultButton(
                        function: () {
                          SocialRegisterCubit.get(context).userRegister();
                        },
                        text: 'register',
                      ),
                    if (state is SocialRegisterLoadingState)
                      Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
