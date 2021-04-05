import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todos.dart';
import 'commonSnackBar.dart';

class NewTodo extends StatefulWidget {
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  var _todoData = {
    'title': '',
    'description': '',
  };
  final _formKey = GlobalKey<FormState>();
  Todos todoContainer;
  void _addNewTodo() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      todoContainer = Provider.of<Todos>(context, listen: false);
      todoContainer.addTodo(_todoData);
      Navigator.of(context).pop();
      commonSnackBar(
        context: context,
        content: 'Todo added into the list.',
        label: 'UNDO',
        todoObj: todoContainer,
        functionSelection: 'removeRecentlyAddedTodo',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                autofocus: true,
                onSaved: (newValue) => _todoData['title'] = newValue,
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                textInputAction: TextInputAction.next,
                validator: (newValue) {
                  if (newValue.isEmpty) return "Enter todo title.";
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (newValue) => _todoData['description'] = newValue,
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Enter todo description.";
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addNewTodo,
                child: Text("Add Todo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
