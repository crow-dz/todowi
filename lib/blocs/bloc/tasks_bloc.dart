import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }
  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(
      TasksState(allTasks: List.from(state.allTasks)..add(event.task)),
    );
    log(List.from(state.allTasks).toString());
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    // get new state from task event
    final state = this.state;
    // get new task from task event
    final task = event.task;
    // still not get it
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    // getting task index
    final int index = state.allTasks.indexOf(task);
    // toggel task isDone
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));
    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {}
}
