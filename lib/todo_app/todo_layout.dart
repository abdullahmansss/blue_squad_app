import 'package:blue_squad_app/todo_app/archived_tasks_screen.dart';
import 'package:blue_squad_app/todo_app/done_tasks_screen.dart';
import 'package:blue_squad_app/todo_app/new_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TodoLayout extends StatefulWidget
{
  @override
  _TodoLayoutState createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout>
{
  Database database;

  int currentIndex = 0;

  List<Widget> widgets =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  @override
  void initState()
  {
    super.initState();
    openOurDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: widgets[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //insertTask();
          //getTasks();
          //updateTask();
          //deleteTask();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          currentIndex = index;

          setState(() {});

          print(index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
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

  void openOurDatabase() async
  {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database db, int version)
      {
        print('database created');
        db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)').then((value)
        {
          print('table created');
        });
      },
      onOpen: (Database db)
      {
        //database = db;
        print('database opened');
      },
    );
  }

  void insertTask()
  {
    database.transaction((txn) async
    {
      int id = await txn.rawInsert('INSERT INTO tasks(title, time, date, status) VALUES("Go to gym", "12:00 pm", "21 April, 2021", "new")');
      print(id);
    });
  }

  void getTasks()
  {
    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      print(value.toString());
    });
  }

  void updateTask()
  {
    database.rawUpdate(
        'UPDATE tasks SET title = ?, status = ? WHERE id = ?',
        ['Have launch', 'done', 1],
    ).then((value)
    {
      print(value);
    });
  }

  void deleteTask()
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [3]).then((value) {
      print(value);
    });
  }
}