import 'package:blue_squad_app/layout/todo/cubit/cubit.dart';
import 'package:blue_squad_app/layout/todo/cubit/states.dart';
import 'package:blue_squad_app/modules/todo/archived_tasks/archived_tasks_screen.dart';
import 'package:blue_squad_app/modules/todo/done_tasks/done_tasks_screen.dart';
import 'package:blue_squad_app/modules/todo/new_tasks/new_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class TodoLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              TodoCubit.get(context).titles[TodoCubit.get(context).currentIndex],
            ),
          ),
          body: TodoCubit.get(context).widgets[TodoCubit.get(context).currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
              TodoCubit.get(context).reset();
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: TodoCubit.get(context).currentIndex,
            onTap: (int index)
            {
              TodoCubit.get(context).changeIndex(index);
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
      },
    );
  }
}