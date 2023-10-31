import 'package:covenbiins_2/dbHelper/mondodb.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

import '../../../../Mongo_Db_Model.dart';

class PublicarView extends StatefulWidget {
  const PublicarView({super.key});

  @override
  State<PublicarView> createState() => _PublicarViewState();
}

class _PublicarViewState extends State<PublicarView> {

  var titulo = TextEditingController();
  var descripcion = TextEditingController();
  var precio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
            const Text(
                "Publicar Inmueble",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: titulo,
                decoration: const InputDecoration(labelText: "Titulo"),
              ),
              TextField(
                controller: descripcion,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(labelText: "Descripcion"),
              ),
              TextField(
                controller: precio,
                decoration: const InputDecoration(labelText: "Precio"),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        _publicar(titulo.text,descripcion.text,precio.text);
                      },
                      child: Text("Publicar")
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _publicar(String titulo, String descripcion, String precio) async{
    var _id = M.ObjectId();
    final data = ModelPublicar(
        id: _id,
        titulo: titulo,
        descripcion: descripcion,
        precio: precio
    );
    var result = await MongoDatabaseDos.insert(data);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Insert ID${_id.$oid}")));
    _limpiar();
  }

  void _limpiar() {
    titulo.text = "";
    descripcion.text = "";
    precio.text = "";
  }

}
