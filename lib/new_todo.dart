import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todos.dart';

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
  // Todos todoObj;

  @override
  Widget build(BuildContext context) {
    void _addNewTodo() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        Provider.of<Todos>(context, listen: false).addTodo(_todoData);
        Navigator.of(context).pop();
      }
    }

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
