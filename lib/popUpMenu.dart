import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todos.dart';

class PopUpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<Todos>(context);
    return PopupMenuButton(
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
    );
  }
}
