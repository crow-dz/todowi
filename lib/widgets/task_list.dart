import 'package:flutter/material.dart';
import 'package:todowi/models/task.dart';
import 'package:todowi/blocs/bloc_exports.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
              value: task.isDone,
            ),
          );
        },
      ),
    );
  }
}
