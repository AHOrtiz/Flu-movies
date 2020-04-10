import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
            ),
          ),
          ListTile(
            title: Text("CRUD"),
            trailing: Icon(Icons.backup),
            onTap: () {
              Navigator.pushNamed(context, 'producto');
            },
          ),
          ListTile(title: Text("Item 2"), trailing: Icon(Icons.home)),
        ],
      ),
    );
  }
}
