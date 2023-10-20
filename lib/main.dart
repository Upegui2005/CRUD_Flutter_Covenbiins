import 'package:covenbiins_2/app/app.dart';
import 'package:covenbiins_2/dbHelper/mondodb.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const App());
}

