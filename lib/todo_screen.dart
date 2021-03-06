import 'package:flutter/material.dart';

import 'popUpMenu.dart';
import 'body.dart';
import 'new_todo.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TodoApp"),
          actions: [
            PopUpMenu(),
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
