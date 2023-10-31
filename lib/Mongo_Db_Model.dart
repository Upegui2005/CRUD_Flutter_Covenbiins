import 'dart:convert';
import 'dart:ffi';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.email,
    required this.password,
  });

  ObjectId id;
  String email;
  String password;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    id: ObjectId.parse(json["_id"]["\$oid"]),
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "password": password,
  };
}

class ModelPublicar {
  ModelPublicar({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.precio,
  });

  ObjectId id;
  String titulo;
  String descripcion;
  String precio;

  factory ModelPublicar.fromJson(Map<String, dynamic> json) => ModelPublicar(
      id: ObjectId.parse(json["_id"]["\$oid"]),
      titulo: json["titulo"],
      descripcion: json["descripcion"],
      precio: json["precio"]
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "titulo": titulo,
    "descripcion": descripcion,
    "precio": precio
  };
}
