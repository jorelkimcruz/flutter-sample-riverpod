// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTodoListHash() => r'd5a57138bf4c29844595133358f1885439c8aac6';

/// See also [filteredTodoList].
@ProviderFor(filteredTodoList)
final filteredTodoListProvider = AutoDisposeProvider<List<TaskModel>>.internal(
  filteredTodoList,
  name: r'filteredTodoListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTodoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTodoListRef = AutoDisposeProviderRef<List<TaskModel>>;
String _$tasksHash() => r'ef718132b5f3aa3ac6e9b4d89335f8c1e8326a02';

/// See also [Tasks].
@ProviderFor(Tasks)
final tasksProvider =
    AutoDisposeNotifierProvider<Tasks, List<TaskModel>>.internal(
  Tasks.new,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Tasks = AutoDisposeNotifier<List<TaskModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
