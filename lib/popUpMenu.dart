import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todos.dart';

class PopUpMenu extends StatefulWidget {
  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  var _selectedMenuItem = 0;
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<Todos>(context, listen: false);
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      initialValue: _selectedMenuItem,
      onSelected: (int selectedValue) {
        if (selectedValue == 0) {
          todoContainer.showPending();
          setState(() {
            _selectedMenuItem = 0;
          });
        } else {
          todoContainer.showCompleted();
          setState(() {
            _selectedMenuItem = 1;
          });
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
    );
  }
}
