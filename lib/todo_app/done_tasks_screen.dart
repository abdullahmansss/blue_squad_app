import 'package:flutter/material.dart';

class DoneTasksScreen extends StatefulWidget
{
  @override
  _DoneTasksScreenState createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen>
{

  @override
  Widget build(BuildContext context)
  {
    int counter = 1;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          OutlinedButton(
            onPressed: ()
            {
              if(counter != 1)
                counter--;

              setState(()
              {

              });
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
              '$counter',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: ()
            {
              counter++;

              setState(() {

              });
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}