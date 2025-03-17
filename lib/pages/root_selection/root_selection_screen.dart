import 'package:flutter/material.dart';
import 'package:flutter_hooks_riverpod_app/routes/router.dart';
import 'package:flutter_hooks_riverpod_app/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootSelectionScreen extends ConsumerWidget {
  const RootSelectionScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: ListView(
          children: [
            ListTile(
              title: const Text("List Screen"),
              onTap: () {
                router.push(TodoListScreenRoute().location);
              },
            ),
            ListTile(
              title: const Text("Login Screen"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
