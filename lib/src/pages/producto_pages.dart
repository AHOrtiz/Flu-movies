import 'package:flutter/material.dart';
import 'package:login/src/Provider/Productos_povider.dart';
import 'package:login/src/models/pelicula_model.dart';
import 'package:login/src/utils/utils.dart';

class ProductosPage extends StatefulWidget {
  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final formKey = GlobalKey<FormState>();
  final peliculaProvider = new ProductosProvider();

  PeliculasModel peliculas = new PeliculasModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas"),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                // Crear año
                _crearAo(),
                _crearDisponible(),
                _crearActor(),
                _crearSinopsis(),
                _crearBoton(),
              ],
            )),
      )),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: peliculas.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre pelicula'),
      onSaved: (value) => peliculas.titulo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre de la pelicula';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearAo() {
    return TextFormField(
      initialValue: peliculas.estreno.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Estreno'),
      onSaved: (value) => peliculas.estreno = int.parse(value),
      validator: (value) {
        if (isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números ';
        }
      },
    );
  }

  Widget _crearActor() {
    return TextFormField(
      initialValue: peliculas.actor,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre  actor'),
      onSaved: (value) => peliculas.actor = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del actor';
        } else {
          return null;
        }
      },
    );
  }
  Widget  _crearSinopsis() {
     return TextFormField(
      initialValue: peliculas.sinopsis,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Sinopsis'),
      onSaved: (value) => peliculas.sinopsis = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese sinopsis ';
        } else {
          return null;
        }
      }
     );

  }
  Widget _crearDisponible() {
    return SwitchListTile(
      value: peliculas.disponible,
      activeColor: Colors.deepOrange,
      onChanged: (value) => setState(() {
        peliculas.disponible = value;
      }),
      title: Text('Disponible'),
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepOrange,
      label: Text('Guardar'),
      textColor: Colors.white,
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();
    
    print(peliculas.titulo);
    print(peliculas.estreno);
    print(peliculas.disponible);

    peliculaProvider.crearProducto(peliculas);
  }

 
}
