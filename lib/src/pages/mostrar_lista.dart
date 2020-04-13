import 'package:flutter/material.dart';
import 'package:login/src/Provider/Productos_povider.dart';

import 'package:login/src/models/pelicula_model.dart';

class MostrarLista extends StatelessWidget {
  final peliculasProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('lista de peliculas'),
       backgroundColor: Colors.pinkAccent
      ),
      
      body: _crearlista(),
    );
  }

  Widget _crearlista() {
    return FutureBuilder(
        future: peliculasProvider.cargarProductos(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PeliculasModel>> snapshot) {
          if (snapshot.hasData) {
            final productos =snapshot.data;
            return ListView.builder(
              itemBuilder: (context , i)=>_crearItem( context, productos[i]),
              itemCount: productos.length,
              );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
  Widget _crearItem(BuildContext context,PeliculasModel producto){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color:Colors.red,
      ),
      onDismissed: (direccion){
        peliculasProvider.borrarProducto(producto.id);
     
      },
          child: ListTile(
        title:  Text('${producto.titulo}- ${producto.estreno}'),
        subtitle: Text(producto.id),
        onTap: ()=> Navigator.pushNamed(context, 'producto', arguments:producto ),
      ),
    );
  }
}
