import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/src/utils/session.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final _session = Session();

  @override
  void initState() { 
    super.initState();
    this.chek();
  }

  chek() async {
    final data = await _session.get();
    if (data != null) {
      Navigator.pushReplacementNamed(context, 'Home');
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(radius: 15.0)
      ),
    );
  }
}