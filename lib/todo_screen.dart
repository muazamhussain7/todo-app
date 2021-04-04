import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'body.dart';
import 'new_todo.dart';
import 'todos.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<Todos>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TodoApp"),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (int selectedValue) {
                if (selectedValue == 0) {
                  todoContainer.showPending();
                } else {
                  todoContainer.showCompleted();
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Pending'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('Completed'),
                  value: 1,
                ),
              ],
            ),
          ],
        ),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => NewTodo(),
          ),
          tooltip: 'New Todo',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
