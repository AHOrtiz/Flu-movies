import 'package:flutter/material.dart';
import 'package:login/src/pages/detalle_pelicula.dart';
import 'package:login/src/pages/home_page.dart';
import 'package:login/src/pages/login.dart';
import 'package:login/src/pages/mostrar_lista.dart';
import 'package:login/src/pages/producto_pages.dart';
import 'package:login/src/pages/registrarse.dart';
import 'package:login/src/pages/splash_page.dart';

Map<String, WidgetBuilder> obtenerRutas(){
  return <String, WidgetBuilder>{
    '/'         : (BuildContext context)  =>  LoginPage(),
    'singup'    : (BuildContext context)  =>  RegistrarsePage(),
    'Home'      : (BuildContext context)  =>  HomePage(),
    'producto'  : (BuildContext context)  =>  ProductosPage(),
    'detalle'   : (BuildContext context)  =>  DetallePeliculaPage(),
    'lista'     : (BuildContext context)  =>  MostrarLista(),
    'splash'    : (BuildContext context)  =>  SplashPage()
  };
}

