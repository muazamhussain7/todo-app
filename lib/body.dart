import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'single_todo.dart';
import 'todos.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoObj = Provider.of<Todos>(context);
    String todoType = todoObj.isOnlyPendingTodos ? 'Pending' : 'Completed';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "$todoType Todos",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        todoObj.todos.length == 0
            ? Center(
                child: Text("There is no todo."),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: todoObj.todos.length,
                  itemBuilder: (context, index) =>
                      SingleTodo(todoObj.todos[index]),
                ),
              ),
      ],
    );
  }
}
