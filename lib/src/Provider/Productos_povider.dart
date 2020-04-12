import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/src/models/pelicula_model.dart';

class ProductosProvider {
  final String _url = 'https://peliculas-82930.firebaseio.com';

  Future<bool> crearProducto(PeliculasModel producto) async {
    final url = '$_url/peliculas.json';

    final resp = await http.post(url, body: peliculasModelToJson(producto));
    final decodedData=json.decode(resp.body);

    print (decodedData);

    return true;
  }
  Future <List<PeliculasModel>> cargarProductos() async{
    final url='$_url/peliculas.json';
    final resp=await http.get(url);

    final Map<String, dynamic>decodedData=json.decode(resp.body);
    final List <PeliculasModel>productos=new List();
    
    if (decodedData==null) return [];
    decodedData.forEach((id, peliculas){
    final prodTemp=PeliculasModel.fromJson(peliculas);
    prodTemp.id=id;

    productos.add(prodTemp);

    });
    print (productos);
    return productos;

  }
}
