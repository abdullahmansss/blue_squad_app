import 'package:blue_squad_app/counter/cubit/cubit.dart';
import 'package:blue_squad_app/counter/cubit/states.dart';
import 'package:blue_squad_app/layout/todo/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    int c = 50;

    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)
        {
          if(state is CounterAy7agaState)
          {
            print('plus');
          }

          if(state is CounterMinusState)
          {
            print(state.s);
          }
        },
        builder: (context, state)
        {
          CounterCubit cubit = BlocProvider.of(context);
          TodoCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                RichText(
                  text: TextSpan(
                    children:
                    [
                      TextSpan(
                        text: 'Abdullah Mansour',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '    ',
                      ),
                      TextSpan(
                        text: 'Abdullah Mansour Hello my name',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ]
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}