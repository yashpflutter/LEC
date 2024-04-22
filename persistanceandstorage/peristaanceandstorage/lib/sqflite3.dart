import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
  Map<String, dynamic> empMap() {
    return {
      'name': name,
      'Emp_id': emp_id,
      'salary': salary,
      'Branch_id': branch_id
    };
  }
}

Future insertEmployeeData(Employee obj) async {
  final localDb = await database;
  await localDb.insert(
    "Employee",
    obj.empMap(),
    ConflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future deleteEmployeeData(Employee obj) async {
  final localDb = await database;
  await localDb.delete(
    "Employee",
    where: "?",
    where: obj.empMap(),
  );
}

Future<List<Employee>> getEmployeedata() async {
  final localDb = await database;
  List<Map<String, dynamic>> listEmployee = await localDb.query("Employee");
  return List.generate(listEmployee.length, (i) {
    return Employee(
      name: listEmployee[i]['name'],
      emp_id: listEmployee[i]['Emp_Id'],
      branch_id: listEmployee[i]['Branch_id'],
      salary: listEmployee[i]['salary'],
    );
  });
}

void main() async {
  //runApp(const MainApp());
  database = openDatabase(
    join(await getDatabasesPath(), "EmployeeDB.db"),
    version: 1,
    onCreate: (dab, version) {
      dab.execute('''CREATE TABLE Employee(
        name TEXT,
        Emp_id INT,
         salary REAL,
         Branch_id INT,
        );''');
    },
  );
  // inset datat
  Employee emp1 =
      Employee(name: "jebna", branch_id: 23, emp_id: 34, salary: 234);
  insertEmployeeData(emp1);

  print("After deletetion ");
  deleteEmployeeData(emp1);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
