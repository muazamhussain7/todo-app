import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Delete the todo ${singleTodo.title}?'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () => todoContainer.removeTodo(singleTodo.id),
                    ),
                  ),
                );
              } else {
                todoContainer.markTodoCompleted(singleTodo.id);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Todo marked as completed.'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () => todoContainer
                          .removeRecentlyCompletedTodo(singleTodo.id),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
