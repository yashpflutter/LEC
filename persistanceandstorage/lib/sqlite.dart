import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

dynamic database;

class Player {
  final String name;
  final int jerno;
  final int runs;
  final double avg;

  Player({
    required this.name,
    required this.jerno,
    required this.runs,
    required this.avg,
  });
  Map<String, dynamic> playerMap() {
    //created map for storing data it will send this data
    return {
      'name': name,
      'jerno': jerno,
      'runs': runs,
      'avg': avg,
    };
  }

  @override
  String toString() {
    return '{name:$name,jerno:$jerno,runs:$runs,avg:$avg}';
  }
}

Future insertPlayerData(Player obj) async {
  final localDB = await database;

  await localDB.insert(
    "Player",
    obj.playerMap(),
    ConflictAlgorithm: ConflictAlgorithm.replace, //conflict situation
  );
}

Future<List<Player>> getPlayerData() async {
  final localDB = await database;
  List<Map<String, dynamic>> listPlayer = await localDB.query("Player");
  return List.generate(listPlayer.length, (i) {
    //it act like a for loop for fetching list whic is in databse
    return Player(
      name: listPlayer[i]['name'],
      jerno: listPlayer[i]['jerno'],
      runs: listPlayer[i]['runs'],
      avg: listPlayer[i]['avg'],
    );
  });
}

void main() async {
  runApp(const MainApp());

  //String path = await getDatabasesPath();
  //print(path);   //use to show where the datat will be stored

  database = openDatabase(join(await getDatabasesPath(), "PlayerDB.db"),
      version: 1, onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE Player(name Text,jerno INTEGRE,runs INT,avg REAL)');
  });
  //insert into

  Player batsman1 = Player(
    //obj of class Player
    name: "Virat Kholi",
    runs: 50000,
    jerno: 18,
    avg: 50.33,
  );

  insertPlayerData(batsman1);

  Player batsman2 = Player(
    //obj of class Player
    name: "Rohit Sharma ",
    runs: 500,
    jerno: 43,
    avg: 50.33,
  );

  insertPlayerData(batsman2);
  Player batsman3 = Player(
    //obj of class Player
    name: "Subhman Gill",
    runs: 100,
    jerno: 23,
    avg: 50.33,
  );

  insertPlayerData(batsman3);
  print(await getPlayerData());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
