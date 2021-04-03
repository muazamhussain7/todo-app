import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoApp"),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        tooltip: 'New Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
