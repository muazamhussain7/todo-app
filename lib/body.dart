import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'single_todo.dart';
import 'todos.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoObj = Provider.of<Todos>(context);
    return todoObj.todos.length == 0
        ? Center(
            child: Text("There is no todo."),
          )
        : ListView.builder(
            itemCount: todoObj.todos.length,
            itemBuilder: (context, index) => SingleTodo(todoObj.todos[index]),
          );
  }
}
