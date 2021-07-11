import 'package:flutter/material.dart';

class MyConditionalBuilder extends StatelessWidget {
  bool condition;
  Widget builder;
  Widget fallback;

  MyConditionalBuilder({
    required this.condition,
    required this.builder,
    required this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    if (this.condition) return builder;

    return fallback;
  }
}
