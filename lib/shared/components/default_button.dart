import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  double width;
  Function function;
  String text;
  bool isUpper;

  DefaultButton({
    required this.function,
    this.width = double.infinity,
    required this.text,
    this.isUpper = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        color: Colors.blue,
        onPressed: (){
          function();
        },
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}