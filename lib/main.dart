import 'package:flutter/material.dart';
import 'package:flutter_hooks_riverpod_app/enums/filter_type_enum.dart';
import 'package:flutter_hooks_riverpod_app/providers/task_form.dart';
import 'package:flutter_hooks_riverpod_app/providers/tasks_provider.dart';
import 'package:flutter_hooks_riverpod_app/providers/list_filter_type_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.read(listFilterTypeProvider.notifier);
    final filterType = ref.watch(listFilterTypeProvider);

    final task = ref.read(tasksProvider.notifier);
    final tasksList = ref.watch(filteredTodoListProvider);

    final taskForm = ref.read(taskFormProvider.notifier);
    final taskFormValues = ref.watch(taskFormProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Task name'),
                      onChanged: taskForm.onNameChanged,
                    ),
                    DropdownButton<FilterType>(
                      value: taskFormValues.type,
                      onChanged: taskForm.toggleFilterType,
                      items: [
                        DropdownMenuItem(
                          value: FilterType.completed,
                          child: Text('Completed'),
                        ),
                        DropdownMenuItem(
                          value: FilterType.inProgress,
                          child: Text('In Progress'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text('Select Filter Type'),
            Column(
              children: [
                RadioListTile<FilterType>(
                  title: const Text('Completed'),
                  value: FilterType.completed,
                  groupValue: filterType,
                  onChanged: filter.toggleFilterType,
                ),
                RadioListTile<FilterType>(
                  title: const Text('In progress'),
                  value: FilterType.inProgress,
                  groupValue: filterType,
                  onChanged: filter.toggleFilterType,
                ),
                RadioListTile<FilterType>(
                  title: const Text('All'),
                  value: FilterType.all,
                  groupValue: filterType,
                  onChanged: filter.toggleFilterType,
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: tasksList.map((e) => Text(e.name)).toList(),
            )),
          ],
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => task.add(taskFormValues), child: const Text('Add Task')),
      ),
    );
  }
}
