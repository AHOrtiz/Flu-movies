import 'package:flutter/material.dart';
import 'package:login/src/pages/home_page.dart';
import 'package:login/src/pages/login.dart';
import 'package:login/src/pages/producto_pages.dart';
import 'package:login/src/pages/registrarse.dart';

Map<String, WidgetBuilder> obtenerRutas(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context)=> LoginPage(),
    'singup'  :(BuildContext context)=> RegistrarsePage(),
    'Home'    :(BuildContext context)=> HomePage(),
    'producto':(BuildContext context)=> ProductosPage(),
  };
}

