import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TO DO APP",
      home: Todoapp(),
    );
  }
}

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});
  @override
  State createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Color.fromRGBO(71, 160, 155, 1),
          title: const Text(
            "To-do list",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 40),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(66, 183, 158, 1),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const Column(children: [Text("create a task")]);
                  });
            },
            child: const Icon(Icons.add)));
  }
}
