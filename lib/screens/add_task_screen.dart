import 'package:flutter/material.dart';
import 'package:todowi/blocs/bloc_exports.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Add Task ",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text("Title"), border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text("Cansle")),
              ElevatedButton(
                  onPressed: () {
                    // catch task title from title controller
                    // set task object to var
                    var task = Task(title: titleController.text);
                    // add task to Addtask event
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text("Add"))
            ],
          )
        ],
      ),
    );
  }
}
