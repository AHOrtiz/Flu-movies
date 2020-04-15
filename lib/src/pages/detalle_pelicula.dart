import 'package:flutter/material.dart';

class DetallePeliculaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(height: 10.0),
          _posterTitulo(context),
          _descipcion()
        ]))
      ],
    ));
  }

  Widget _crearAppBar() {
    return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.pinkAccent,
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: FadeInImage(
              image: NetworkImage(
                  "https://images-na.ssl-images-amazon.com/images/I/71YwxjfhEiL._AC_SY606_.jpg"),
              placeholder: NetworkImage(
                  "https://raw.githubusercontent.com/Irwing-Herrera/flutter-Peliculas/master/assets/img/placeholder.png"),
              fit: BoxFit.cover),
        ));
  }

  Widget _posterTitulo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
                image: NetworkImage(
                    "https://images-na.ssl-images-amazon.com/images/I/71YwxjfhEiL._AC_SY606_.jpg"),
                height: 150.0),
          ),
          SizedBox(width: 10.0),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Onward',
                  style: Theme.of(context).textTheme.title,
                  overflow: TextOverflow.ellipsis),
              Text('Año: 2020',
                  style: Theme.of(context).textTheme.subtitle,
                  overflow: TextOverflow.ellipsis),
              Text('Duración: 103 min.',
                  style: Theme.of(context).textTheme.subtitle,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: <Widget>[
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _descipcion() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
          "En un mundo habitado por criaturas mitológicas tales como elfos, centauros, hadas, cíclopes, entre otros, la magia fue un recurso utilizado por hechiceros para ayudar a los demás a mejorar su estilo de vida. No obstante, con el surgimiento de la tecnología moderna, esto ocasionó que gradualmente las criaturas mágicas se olviden de la magia y que se vuelva obsoleta.1​ En el presente, un elfo adolescente llamado Ian Lightfoot está nervioso por celebrar su décimo sexto cumpleaños junto a su madre viuda y su hermano mayor Barley, desempleado y obsesionado con la historia de sus ancestros y juegos de rol, pero dado a que Ian es demasiado tímido para invitar a sus amigos de la universidad, se resigna a celebrar solo con su familia.",
          textAlign: TextAlign.justify),
    );
  }

}