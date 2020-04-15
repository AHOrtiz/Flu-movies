import 'package:flutter/material.dart';
import 'src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flu-movie',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes:  obtenerRutas(),
     
    );
  }
}

