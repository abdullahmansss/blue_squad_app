import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  bool isMale;
  int age;
  int weight;
  int height;

  ResultScreen({
    @required this.height,
    @required this.age,
    @required this.weight,
    @required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result Screen',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$isMale',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              '$age',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              '$height',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              '$weight',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
