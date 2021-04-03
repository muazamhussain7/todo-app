import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todos.dart';

class SingleTodo extends StatelessWidget {
  final Todos singleTodo;
  const SingleTodo(this.singleTodo);
  @override
  Widget build(BuildContext context) {
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
            onPressed: () => Provider.of<Todos>(context, listen: false)
                .removeTodo(singleTodo.id),
          ),
        ),
      ),
    );
  }
}
