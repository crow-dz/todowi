import 'package:flutter/material.dart';
import 'package:todowi/blocs/bloc/tasks_bloc.dart';
import 'package:todowi/models/task.dart';

import 'blocs/bloc_exports.dart';
import 'screens/task_screen.dart';

void main() {
  /*  BlocOverrides.runZoned(() => ); */
/*    Bloc.observer = CustomBlocObserver();
  Bloc.transformer = customEventTransformer(); */
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TasksBloc()..add(AddTask(task: Task(title: "test task"))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
