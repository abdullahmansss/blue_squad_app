import 'package:blue_squad_app/layout/todo/cubit/cubit.dart';
import 'package:blue_squad_app/layout/todo/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskModel {
  String title;
  String time;
  String date;

  TaskModel({
    this.title,
    this.time,
    this.date,
  });
}

class NewTasksScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildTaskItem(TodoCubit.get(context).newTasks[index], context),
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[300],
            thickness: 1.0,
          ),
          itemCount: TodoCubit.get(context).newTasks.length,
        );
      },
    );
  }

  Widget buildTaskItem(task, context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                task['time'].toString(),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task['title'],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    task['date'],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                TodoCubit.get(context).updateTask(
                  id: task['id'],
                  status: 'done',
                );
              },
              icon: Icon(
                Icons.check_box,
              ),
            ),
            IconButton(
              onPressed: () {
                TodoCubit.get(context).updateTask(
                  id: task['id'],
                  status: 'archived',
                );
              },
              icon: Icon(
                Icons.archive,
              ),
            ),
          ],
        ),
      );
}