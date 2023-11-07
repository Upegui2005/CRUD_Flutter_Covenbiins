import 'dart:developer';

import 'package:covenbiins_2/Mongo_Db_Model.dart';
import 'package:covenbiins_2/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static var db, userColection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userColection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userColection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async{
    try{
      var result = await userColection.insertOne(data. toJson());
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