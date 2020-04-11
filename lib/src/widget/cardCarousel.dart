import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardCarouselWidgwt extends StatefulWidget {
  final List<dynamic> peliculas;

  CardCarouselWidgwt({@required this.peliculas});

  @override
  _CardCarouselWidgwtState createState() => _CardCarouselWidgwtState();
}

class _CardCarouselWidgwtState extends State<CardCarouselWidgwt> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                child: FadeInImage(
                  image: NetworkImage(
                      "https://images-na.ssl-images-amazon.com/images/I/71YwxjfhEiL._AC_SY606_.jpg"),
                  placeholder: NetworkImage(
                      "https://raw.githubusercontent.com/Irwing-Herrera/flutter-Peliculas/master/assets/img/placeholder.png"),
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'detalle');
                },
              ),
            );
          },
          itemCount: 10,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          layout: SwiperLayout.STACK),
    );
  }
}
