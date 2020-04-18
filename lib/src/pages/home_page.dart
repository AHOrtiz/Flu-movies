import 'package:flutter/material.dart';
import 'package:login/src/Provider/Productos_povider.dart';
import 'package:login/src/widget/cardCarousel.dart';
import 'package:login/src/widget/drawer.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Top mejores Peliculas',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20.0),
            _carouselPeliculas()
          ],
        ),
      ),
    );
  }

  Widget _carouselPeliculas() {
    return FutureBuilder(
      future: peliculasProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardCarouselWidgwt(peliculas: snapshot.data);
        }
        else {
          return Container(height: 400,child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}