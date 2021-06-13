import 'package:blue_squad_app/counter/cubit/cubit.dart';
import 'package:blue_squad_app/layout/todo/cubit/cubit.dart';
import 'package:blue_squad_app/layout/todo/todo_layout.dart';
import 'package:blue_squad_app/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()
{
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

// 1. state less widget
// 2. state full widget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => TodoCubit()..openOurDatabase(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoLayout(),
      ),
    );
  }
}
