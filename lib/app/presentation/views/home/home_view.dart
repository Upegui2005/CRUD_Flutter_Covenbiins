import 'package:covenbiins_2/Mongo_Db_Model.dart';
import 'package:covenbiins_2/dbHelper/mondodb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
              future: MongoDatabase.getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;
                    print("Total Data" + totalData.toString());
                    return ListView.builder(
                        itemCount: snapshot.data.length, // Corregido: 'length' en lugar de 'lenght'
                        itemBuilder: (context, index){
                          return displayCard(MongoDbModel.fromJson(snapshot.data[index]));
                        }
                    );

                  } else {
                    return const Center(
                      child: Text("No data Available"),
                    );
                  }
                }
              },
            ),
          )
      ),
    );
  }

  Widget displayCard(MongoDbModel data){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${data.id.$oid}"),
            SizedBox(height: 5,),
            Text("${data.email}"),
            SizedBox(height: 5,),
            Text("${data.password}"),
          ],
        ),
      ),
    );
  }
}
