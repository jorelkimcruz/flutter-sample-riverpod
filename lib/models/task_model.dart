import 'package:flutter_hooks_riverpod_app/enums/filter_type_enum.dart';

class TaskModel {
  TaskModel(this.name, this.type);
  final String name;
  final FilterType type;

  TaskModel copyWith({
    String? name,
    FilterType? type,
  }) {
    return TaskModel(
      name ?? this.name,
      type ?? this.type,
    );
  }
}
