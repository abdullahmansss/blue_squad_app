import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
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
          onPressed: (){
            print('leading clicked');
          },
        ),
        title: InkWell(
          onDoubleTap: ()
          {
            print('title double tap');
          },
          onTap: ()
          {
            print('title single tap');
          },
          onLongPress: ()
          {
            print('title long tap');
          },
          child: Text(
            'Blue Squad App',
          ),
        ),
        actions:
        [
          IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: ()
            {
              print('notifications clicked');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: ()
            {
              print('search clicked');
            },
          ),
        ],
      ),
    );
  }
}
