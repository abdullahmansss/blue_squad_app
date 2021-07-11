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

  late Database database;

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

  void insertTask({
  required String title,
  required String time,
  required String date,
})
  {
    database.transaction((txn) async
    {
      txn.rawInsert('INSERT INTO tasks(title, time, date, status) VALUES("$title", "$time", "$date", "new")').then((value)
      {
        emit(TodoInsertTaskState());
        getTasks();
      });
    });
  }

  List<Map<String, dynamic>> newTasks = [];
  List<Map<String, dynamic>> doneTasks = [];
  List<Map<String, dynamic>> archivedTasks = [];

  void getTasks()
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

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

  void updateTaskStatus({
  required String status,
  required int id,
})
  {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value)
    {
      emit(TodoUpdateTaskStatusState());
      getTasks();
    });
  }

  //https://impressgaming.com/wp-json/api/categories

  // 1. base url : https://impressgaming.com/
  // 2. end point : wp-json/api/categories
  // 3. method : GET

  void updateTask({
    required int id,
    required String title,
    required String time,
    required String date,
  })
  {
    database.rawUpdate(
      'UPDATE tasks SET title = ?, time = ?, date = ? WHERE id = ?',
      ['$title', '$time', '$date', id],
    ).then((value)
    {
      emit(TodoUpdateTaskState());
      getTasks();
    });
  }

  void deleteTask(int id)
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value)
    {
      getTasks();
    });
  }

  void reset()
  {
    doneTasks = [];

    emit(TodoDeleteTaskState());
  }

  bool isBottomShown = false;

  void changeBottomVisibility(bool visibility)
  {
    isBottomShown = visibility;
    emit(TodoBottomSheetState());
  }

  void openBottomSheetUpdate(Map<String, dynamic> task)
  {
    emit(TodoBottomSheetUpdateState(
      task: task,
    ));
  }
}