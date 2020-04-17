import 'package:flutter/material.dart';
// import 'package:login/src/utils/session.dart';

class DrawerWidget extends StatelessWidget {

  // final _session = Session();
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              accountName: Text("Allison Herrera"),
              accountEmail: Text("allis2789@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0, color: Colors.pinkAccent),
                ),
              )),
          ListTile(
            title: Text("Agregar peliculas"),
            trailing: Icon(Icons.add),
            onTap: () {
              Navigator.pushNamed(context, 'producto');
            },
          ),
          ListTile(
            title: Text("Mostrar lista de peliculas"),
            trailing: Icon(Icons.list),
            onTap: () {
              Navigator.pushNamed(context, 'lista');
            },
          ),
          ListTile(
            title: Text("Cerrar Sesión"),
            trailing: Icon(Icons.close),
            onTap: () {
              // _session.delete();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
