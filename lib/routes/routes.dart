import 'package:flutter/material.dart';
import 'package:flutter_hooks_riverpod_app/pages/list/todo_list_screen.dart';
import 'package:flutter_hooks_riverpod_app/pages/root_selection/root_selection_screen.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

class _RouteNames {
  static const todoListScreen = '/todo_list_screen';
  static const rootSelection = '/root_selection';
}

@TypedGoRoute<RootSelectionScreenRoute>(
  path: _RouteNames.rootSelection,
  routes: [
    TypedGoRoute<TodoListScreenRoute>(path: _RouteNames.todoListScreen),
  ],
)
class RootSelectionScreenRoute extends GoRouteData {
  const RootSelectionScreenRoute();

  /// Important note on this redirect function: this isn't reactive.
  /// No redirect will be triggered on a user role change.
  ///
  /// This is currently unsupported.

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RootSelectionScreen();
  }
}

@TypedGoRoute<TodoListScreenRoute>(path: _RouteNames.todoListScreen)
class TodoListScreenRoute extends GoRouteData {
  const TodoListScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TodoListScreen();
  }
}
