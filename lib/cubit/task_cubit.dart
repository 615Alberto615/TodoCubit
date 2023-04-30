import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proyecto_todo2/modelo/modelo_task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState([], []));

  void saveTask(Task task) {
    List<Task> newTasks = List.from(state.tasks);
    newTasks.add(task);
    emit(TaskState(newTasks, state.tags));
  }

  void deleteTask(Task task) {
    List<Task> newTasks = List.from(state.tasks);
    newTasks.remove(task);
    emit(TaskState(newTasks, state.tags));
  }

  void actualizarTask(Task task) {
    List<Task> newTasks = List.from(state.tasks);
    for (int i = 0; i < newTasks.length; i++) {
      if (newTasks[i].id == task.id) {
        newTasks[i] = task;
        break;
      }
    }
    emit(TaskState(newTasks, state.tags));
  }

  toggleTask(Task task) {
    List<Task> newTasks = List.from(state.tasks);
    newTasks.remove(task);
    newTasks.add(task);
    emit(TaskState(newTasks, state.tags));
  }
}
