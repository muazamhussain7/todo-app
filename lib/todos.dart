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

  
}
