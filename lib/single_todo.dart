import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'commonSnackBar.dart';
import 'todos.dart';

class SingleTodo extends StatelessWidget {
  final Todos singleTodo;
  const SingleTodo(this.singleTodo);

  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<Todos>(context, listen: false);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(
            singleTodo.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            singleTodo.description,
          ),
          trailing: IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if (singleTodo.isCompleted) {
                commonSnackBar(
                  context: context,
                  content: 'Delete the todo "${singleTodo.title}"?',
                  label: 'OK',
                  todoObj: todoContainer,
                  functionSelection: 'removeTodo',
                  todoId: singleTodo.id,
                );
              } else {
                todoContainer.markTodoCompleted(singleTodo.id);
                commonSnackBar(
                  context: context,
                  content: 'Todo marked as completed.',
                  label: 'UNDO',
                  todoObj: todoContainer,
                  functionSelection: 'removeRecentlyCompletedTodo',
                  todoId: singleTodo.id,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
