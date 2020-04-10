import 'package:flutter/material.dart';
import 'package:login/src/widget/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: DrawerWidget(),
      body: Container(),
     
    );
  }

  
}
