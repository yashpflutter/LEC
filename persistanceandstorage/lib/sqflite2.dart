import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;

class Player {
  final String name;
  final int jreno;
  final int runs;
  final double avg;

  Player({
    required this.name,
    required this.jreno,
    required this.runs,
    required this.avg,
  });

  Map<String, dynamic> playerMap() {
    //create map for storing data it will send this data
    return {
      'name': name,
      'jreno': jreno,
      'runs': runs,
      'avg': avg,
    };
  }

  @override
  String toString() {
    return '{name:$name,jerno:$jreno,runs:$runs,avg:$avg}';
  }
}

//------------------------------------------------>
Future insertPlayerData(Player obj) async {
  final localDB = await database;

  await localDB.insert(
    "Player",
    obj.playerMap(),
    ConflictAAlgoritm: ConflictAlgorithm.replace,
  );

  await localDB.re;
}

//--------------------------------------------->
Future<List<Player>> getPlayerData() async {
  final localDb = await database;
  List<Map<String, dynamic>> listPlayer = await localDb.query("Player");
  return List.generate(listPlayer.length, (i) {
    //it act like a for loope for fetching list which is in the
    return Player(
      name: listPlayer[i]['name'],
      jreno: listPlayer[i]['jreno'],
      runs: listPlayer[i]['runs'],
      avg: listPlayer[i]['avg'],
    );
  });
}

//------------------------------------------------->
void main() async {
  runApp(const MainApp());

  database = openDatabase(
    join(await getDatabasesPath(), "playerDB.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE Player(name Text,jerno INT,runs INT,avg REAL)''');
    },
  );
  //insert data

  Player batsman1 = Player(
    //obj of class Player
    name: "Virat Kholi",
    runs: 50000,
    jreno: 18,
    avg: 50.33,
  );
  insertPlayerData(batsman1);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold());
  }
}
