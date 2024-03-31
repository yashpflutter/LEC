import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

dynamic database;

class Employee {
  final String name;
  final int emp_id;
  final double salary;
  final int branch_id;

  Employee({
    required this.name,
    required this.emp_id,
    required this.branch_id,
    required this.salary,
  });
}

void main() async {
  runApp(const MainApp());
  database = openDatabase(
    join(await getDatabasesPath(), "EmployeeDB.db"),
    version: 1,
    onCreate: (dab, version) {
      dab.execute('''CREATE TABLE EMPLOYEE(
        name TEXT,
        Emp_id INT,
         salary REAL,
         Branch_id INT,
        );''');
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
