import 'package:flutter/material.dart';

class Todos with ChangeNotifier {
  final String id;
  final String title;
  final String description;

  Todos({
    this.id,
    this.title,
    this.description,
  });

  List<Todos> _todos = [];

  List<Todos> get todos {
    return [..._todos];
  }

  void addTodo(Map<String, String> todo) {
    print(todo);
    final newTodo = Todos(
      id: DateTime.now().toString(),
      title: todo['title'],
      description: todo['description'],
    );
    _todos.insert(0, newTodo);
    notifyListeners();
  }
}
