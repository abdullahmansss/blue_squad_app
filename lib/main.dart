import 'package:blue_squad_app/bmi_screen.dart';
import 'package:blue_squad_app/counter/counter_screen.dart';
import 'package:blue_squad_app/home_screen.dart';
import 'package:blue_squad_app/todo_app/todo_layout.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

// 1. state less widget
// 2. state full widget

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreenScreen(),
    );
  }
}