import 'package:flutter/material.dart';

import 'todos.dart';

void commonSnackBar({
  BuildContext context,
  String content,
  String label,
  Todos todoObj,
  String functionSelection,
  String todoId,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: label,
        onPressed: () {
          if (functionSelection == 'removeRecentlyAddedTodo') {
            todoObj.removeRecentlyAddedTodo();
          } else if (functionSelection == 'removeRecentlyCompletedTodo') {
            todoObj.removeRecentlyCompletedTodo(todoId);
          } else {
            todoObj.removeTodo(todoId);
          }
        },
      ),
    ),
  );
}
