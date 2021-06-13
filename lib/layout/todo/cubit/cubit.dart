import 'package:blue_squad_app/layout/todo/cubit/states.dart';
import 'package:blue_squad_app/modules/todo/archived_tasks/archived_tasks_screen.dart';
import 'package:blue_squad_app/modules/todo/done_tasks/done_tasks_screen.dart';
import 'package:blue_squad_app/modules/todo/new_tasks/new_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class TodoCubit extends Cubit<TodoStates>
{
  TodoCubit() : super(TodoInitialState());

  static TodoCubit get(context) => BlocProvider.of(context);

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

  void changeIndex(index)
  {
    currentIndex = index;
    emit(TodoChangeBottomBarState());
  }

  Database database;

  void openOurDatabase()
  {
    openDatabase(
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
    ).then((value)
    {
      emit(TodoOpenDatabaseState());
      database = value;
      getTasks();
    });
  }

  void insertTask()
  {
    database.transaction((txn) async
    {
      int id = await txn.rawInsert('INSERT INTO tasks(title, time, date, status) VALUES("Go to gym", "12:00 pm", "21 April, 2021", "new")');
      print(id);
    });
  }

  List<Map<String, dynamic>> newTasks = [];
  List<Map<String, dynamic>> doneTasks = [];
  List<Map<String, dynamic>> archivedTasks = [];

  void getTasks()
  {
    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      value.forEach((element)
      {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });

      emit(TodoGetTasksState());
    });
  }

  void updateTask()
  {
    database.rawUpdate(
      'UPDATE tasks SET title = ?, status = ? WHERE id = ?',
      ['Have launch', 'archived', 3],
    ).then((value)
    {
      print(value);
      emit(TodoUpdateTaskState());
    });
  }

  void deleteTask()
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [3]).then((value) {
      print(value);
    });
  }

  void reset()
  {
    doneTasks = [];

    emit(TodoDeleteTaskState());
  }
}