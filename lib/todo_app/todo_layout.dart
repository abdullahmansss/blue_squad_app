import 'package:blue_squad_app/todo_app/archived_tasks_screen.dart';
import 'package:blue_squad_app/todo_app/done_tasks_screen.dart';
import 'package:blue_squad_app/todo_app/new_tasks_screen.dart';
import 'package:flutter/material.dart';

class TodoLayout extends StatefulWidget {
  @override
  _TodoLayoutState createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout>
{
  int currentIndex = 0;

  List<Widget> widgets =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index)
        {
          currentIndex = index;
          setState(() {

          });
          print(index);
        },
        type: BottomNavigationBarType.fixed,
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'New Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Done Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archived Tasks',
          ),
        ],
      ),
    );
  }
}
