import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

dynamic database;

class Player {
  final String name;
  final int jerNo;
  final int runs;
  final double avg;
  Player({
    required this.name,
    required this.jerNo,
    required this.runs,
    required this.avg,
  });
  Map<String, dynamic> playerMap() {
    return {
      'name': name,
      'jerNo': jerNo,
      'runs': runs,
      'avg': avg,
    };
  }

  @override
  String toString() {
    return '{name:$name,jerNo:$jerNo,runs:$runs,avg:$avg}';
  }
}

Future insertPlayerData(Player obj) async {
  ///ASSIGN THE DATABASE TO THE LOCAL VARIABLE localDB
  final localDB = await database;

  ///THE INSERT METHOD FROM THE DATABASE CLASS IS USED TO INSERT THE DATA IN THE PLAYER TABLE
  ///THE INSERT METHOD TAKES 3 PARAMETERS i.e TABLE NAME, MAP OF DATA TO BE PASSED, CONFLICT ALGORITHM
  ///THE CONFLICT ALGORITHM IS APPLIED WHEN DATA WITH SAME PRIMARYKEY IS INSERTED
  await localDB.insert(
    "Player",
    obj.playerMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Player>> getPlayerData() async {
  final localDB = await database;

  ///THE QUERY METHOD FROM THE DATABASE CLASS RETURNS A LIST OF MAP
  ///WHICH CONTAINS ALL THE DATA PRESENT IN THE TABLE Player.
  List<Map<String, dynamic>> listPlayers = await localDB.query("Player");

  ///HERE WE WILL CONVERT THE LIST OF MAP RETURNED FROM THE queryMETHOD INTO THE LIST OF OBJECTS OF PLAYERS
  return List.generate(listPlayers.length, (i) {
    return Player(
      name: listPlayers[i]['name'],
      jerNo: listPlayers[i]['jerNo'],
      runs: listPlayers[i]['runs'],
      avg: listPlayers[i]['avg'],
    );
  });
}

void main() async {
  ///WE HAVE COMMENTED THE runApp METHOD SO WE WILL HAVE TO CALL
  ///THE ensureInitialized method FROM THE WidgetsFlutterBinding classWidgetsFlutterBinding.ensureInitialized();
  ///THE openDatabase METHOD OF THE DATABASE CLASS IS CALLED HERETHIS METHOD RETURNS AN OBJECT OF DATABASE
  ///WE WILL ASSIGN THIS OBJECT OF DATABASE TO THE GLOBAL VARIABLE database.
  ///WE HAVE PASSED THE openDatabase class 3 parameters i.e
  ///1. path 2. version 3. onCreate
  ///THE PATH IS THE PATH WHERE THE DATABASES ARE STORED IT WILL BEDIFFERENT FOR EMULATORS AND REAL DEVICE
  ///getDatabasesPath METHOD WILL GIVE THE DEFAULT PATH FOR THE DATABASES FOR THE RESPECTIVE DEVICE
  ///THE VERSION WILL BE THE VERSION OF THE CURRENT DATABASE
  ///onCreate callback WILL CONTAIN THE STEPS WHICH WE WANT TO PERFORM WHEN OUR DATABASE IS CREATED
  ///IN OUR CASE WE HAVE CREATED A TABLE Player .
  ///THE PLAYER TABLE CONTAINS 4 COLUMNS i.e name, jerNo, runs,avg
  ///THE jerNo IS THE PRIMARY KEY.

  database = openDatabase( 
    join(await getDatabasesPath(), "PlayerDB.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''CREATE TABLE Player(
                          name TEXT,
                          jerNo INTEGER PRIMARY KEY,
                          runs INT,
                         avg REAL) ''');
    },
  );
//insert into
  Player batsman1 = Player(
    name: "Virat Kohli",
    jerNo: 18,
    runs: 50000,
    avg: 50.33,
  );

  ///WE HAVE CREATED AN OBJECT OF THE PLAYER CLASS TO INSERT IT INTO THE DATABASE
  insertPlayerData(batsman1);
  Player batsman2 = Player(
    name: "Rohit Sharma",
    jerNo: 45,
    runs: 40000,
    avg: 10.33,
  );
  insertPlayerData(batsman2);
  Player batsman3 = Player(
    name: "Shubman Gill",
    jerNo: 77,
    runs: 80000,
    avg: 30.33,
  );
  await insertPlayerData(batsman3);
  print(await getPlayerData());
}
