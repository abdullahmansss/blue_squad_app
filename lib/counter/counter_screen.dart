import 'package:blue_squad_app/counter/cubit/cubit.dart';
import 'package:blue_squad_app/counter/cubit/states.dart';
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

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children:
              [
                Text(
                  'Abdullah Mansour',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    OutlinedButton(
                      onPressed: ()
                      {
                        cubit.minus();
                        //print(c);
                      },
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      child: Text(
                        '${cubit.counter}',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: ()
                      {
                        cubit.plus();
                        //print(c);
                      },
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children:
                //   [
                //     OutlinedButton(
                //       onPressed: ()
                //       {
                //         c--;
                //         print(c);
                //       },
                //       child: Icon(
                //         Icons.remove,
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 30.0,
                //       ),
                //       child: Text(
                //         '$c',
                //         style: TextStyle(
                //           fontSize: 30.0,
                //           fontWeight: FontWeight.w900,
                //         ),
                //       ),
                //     ),
                //     OutlinedButton(
                //       onPressed: ()
                //       {
                //         c++;
                //         print(c);
                //       },
                //       child: Icon(
                //         Icons.add,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}