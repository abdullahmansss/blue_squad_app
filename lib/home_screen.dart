import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: false,
        titleSpacing: 16.0,
        elevation: 6.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            print('leading clicked');
          },
        ),
        title: InkWell(
          onDoubleTap: () {
            print('title double tap');
          },
          onTap: () {
            print('title single tap');
          },
          onLongPress: () {
            print('title long tap');
          },
          child: Text(
            'Blue Squad App',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('notifications clicked');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              print('search clicked');
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.min,
          children:
          [
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.deepOrange,
              child: Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.teal,
              child: Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.deepOrange,
              child: Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}