import 'package:flutter/material.dart';

class Todos with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  bool isCompleted;

  Todos({
    this.id,
    this.title,
    this.description,
    this.isCompleted = false,
  });

  bool _isOnlyPendingTodos = true;
  List<Todos> _todos = [];

  void showCompleted() {
    _isOnlyPendingTodos = false;
    notifyListeners();
  }

  void showPending() {
    _isOnlyPendingTodos = true;
    notifyListeners();
  }

  List<Todos> get todos {
    if (_isOnlyPendingTodos) {
      return _todos.where((todo) => todo.isCompleted == false).toList();
    } else {
      return _todos.where((todo) => todo.isCompleted).toList();
    }
  }

  void addTodo(Map<String, String> todo) {
    final newTodo = Todos(
      id: DateTime.now().toString(),
      title: todo['title'],
      description: todo['description'],
    );
    _todos.insert(0, newTodo);
    notifyListeners();
  }

  void markTodoCompleted(String todoId) {
    Todos todo = _todos.firstWhere((todo) => todo.id == todoId);
    todo.isCompleted = true;
    notifyListeners();
  }

  void removeRecentlyAddedTodo() {
    _todos.removeAt(0);
    notifyListeners();
  }

  void removeRecentlyCompletedTodo(String todoId) {
    Todos todo = _todos.firstWhere((todo) => todo.id == todoId);
    todo.isCompleted = false;
    notifyListeners();
  }

  void removeTodo(String todoId) {
    _todos.removeWhere(
      (todo) => todo.id == todoId,
    );
    notifyListeners();
  }
}
