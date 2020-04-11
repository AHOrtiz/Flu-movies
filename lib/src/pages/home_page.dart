import 'package:flutter/material.dart';
import 'package:login/src/widget/cardCarousel.dart';
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
    return CardCarouselWidgwt(peliculas: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  }
}