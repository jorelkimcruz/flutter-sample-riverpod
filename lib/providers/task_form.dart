import 'package:flutter_hooks_riverpod_app/enums/filter_type_enum.dart';
import 'package:flutter_hooks_riverpod_app/models/task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'task_form.g.dart';

@riverpod
class TaskForm extends _$TaskForm {
  @override
  TaskModel build() {
    return TaskModel('', FilterType.inProgress);
  }

  void toggleFilterType(FilterType? type) {
    state = state.copyWith(type: type);
  }

  void onNameChanged(String name) {
    state = state.copyWith(name: name);
  }
}
