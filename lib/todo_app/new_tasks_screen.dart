import 'package:flutter/material.dart';

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

class NewTasksScreen extends StatelessWidget {
  List<TaskModel> tasks = [
    TaskModel(
      title: 'Task 1',
      time: '12:00 pm',
      date: '21 April, 2021',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buildTaskItem(tasks[index]),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
                thickness: 1.0,
              ),
              itemCount: tasks.length,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buildTaskItem(tasks[index]),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: tasks.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async
        {
          String name = '';

          try
          {
            name = await getName();
            print(name);
            throw('Abdullah Error');
          }
          catch(error)
          {
            print(error.toString());
          }

          getName().then((value) {
            //throw('Abdullah Error');
            print(value);
          }).catchError((error) {
            print(error.toString());
          });
        },
      ),
    );
  }

  Future<String> getName() async {
    return 'Ahmed';
  }

  Widget buildTaskItem(TaskModel model) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                model.time,
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
                    model.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    model.date,
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check_box,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.archive,
              ),
            ),
          ],
        ),
      );
}
