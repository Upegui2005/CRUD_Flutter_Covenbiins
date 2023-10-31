import 'dart:developer';

import 'package:covenbiins_2/Mongo_Db_Model.dart';
import 'package:covenbiins_2/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static late Db db;
  static late var userCollection, userCollection2;

  static Future<void> connect() async {
  if (db == null) {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
    userCollection2 = db.collection(USER_COLLECTION_DOS);
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async{
    try{
      var result = await userCollection.insertOne(data. toJson());
      if(result){
        return "Data Insert";
      }
      else{
        return "No Data Insert";
      }
    }
    catch (e){
      print(e.toString());
      return e.toString();
    }
  }

}

class MongoDatabaseDos{

  static Future<String> insert(ModelPublicar data) async{
    try{
      var result = await userColection2.insertOne(data.toJson());
      if(result.isSuccess){
        return "Data Insert";
      }
      else{
        return "No Data Insert";
      }
    }
    catch (e){
      print(e.toString());
      return e.toString();
    }
  }
}