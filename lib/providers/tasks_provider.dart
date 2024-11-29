import 'package:flutter_hooks_riverpod_app/enums/filter_type_enum.dart';
import 'package:flutter_hooks_riverpod_app/models/task_model.dart';
import 'package:flutter_hooks_riverpod_app/providers/list_filter_type_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
part 'tasks_provider.g.dart';

@riverpod
class Tasks extends _$Tasks {
  @override
  List<TaskModel> build() {
    return [];
  }

  void add(TaskModel task) {
    state = [...state, task];
  }
}

@riverpod
List<TaskModel> filteredTodoList(Ref ref) {
// obtains both the filter and the list of todos
  final FilterType filter = ref.watch(listFilterTypeProvider);
  final List<TaskModel> tasks = ref.watch(tasksProvider);

  switch (filter) {
    case FilterType.completed:
    case FilterType.inProgress:
      // return the completed list of todos
      return tasks.where((todo) => todo.type == filter).toList();
    case FilterType.all:
      // returns the unfiltered list of todos
      return tasks;
  }
}
