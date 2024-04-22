import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class Zomato {
  int? orderNO;
  final String custName;
  final String hotelName;
  final String food;
  final double bill;
  Zomato({
    this.orderNO,
    required this.custName,
    required this.hotelName,
    required this.food,
    required this.bill,
  });
  Map<String, dynamic> zomatoMap() {
    return {
      //'orderNO': orderNO,
      'custName': custName,
      'hotelName': hotelName,
      'food': food,
      'bill': bill,
    };
  }

  @override
  String toString() {
    return '{orderNO:$orderNO,custName:$custName,hotelName:$hotelName,food:$food,bill:$bill}';
  }
}

dynamic database;
Future<void> insertzomatoorderdata(Zomato obj) async {
  final localDB = database;
  await localDB.insert("zomatotable", obj.zomatoMap(),
      conflictAlgorithm: ConflictAlgorithm);
}

Future<void> deletezomatotabledata(Zomato obj) async {
  final localdb = await database;
  await localdb.delete(
    "zomatotaable",
    where: "orderNO=?",
    whereArgs: [obj.orderNO],
  );
}

Future<List<Zomato>> getzomatotabledata() async {
  final localDB = await database;
  List<Map<String, dynamic>> orderMap = await localDB.query("OrderFood");

  return List.generate(orderMap.length, (i) {
    return Zomato(
      orderNO: orderMap[i]['orderNO'],
      custName: orderMap[i]['custName'],
      hotelName: orderMap[i]['hotelName'],
      food: orderMap[i]['food'],
      bill: orderMap[i]['bill'],
    );
  });
}

//update
Future<void> updatezomatotabledata(Zomato obj) async {
  final localdb = await database;
  await localdb.update("zomatotable", obj.zomatoMap(),
      where: 'orderNO=?', whereArgs: [obj.orderNO]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(join(await getDatabasesPath(), "ZomatoDB.db"),
      version: 1, onCreate: (db, version) {
    db.execute('''CREATE TABLE zomatotable(
      orderNO INT PRIMARY KEY AUTOINCREMENT,
      custName TEXT,
      hotelName TEXT,
      food TEXT,
      bill REAL)''');
  });
  //insert data
  Zomato order1 = Zomato(
      orderNO: 123,
      custName: 'Yash',
      hotelName: 'Royal chines',
      food: 'Triplerice,mancurian',
      bill: 300.00);
  insertzomatoorderdata(order1);

  Zomato order2 = Zomato(
      orderNO: 123,
      custName: 'Yash',
      hotelName: 'Sandeep',
      food: 'VegBriyani,Tandori Briyani',
      bill: 250.40);
  insertzomatoorderdata(order2);

  print(await getzomatotabledata());
  //delete
  deletezomatotabledata(order2);
  print(await getzomatotabledata());
  order1 = Zomato(
      orderNO: order1.orderNO,
      custName: order1.custName,
      hotelName: order1.hotelName,
      food: "${order1.food}PaniPuri,pavbhaji", //food(order1.food+"panipuri")
      bill: order1.bill + 150.00);

  updatezomatotabledata(order1);
  print(await getzomatotabledata());
}
