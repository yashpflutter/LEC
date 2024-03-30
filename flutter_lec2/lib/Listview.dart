import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: ListviewDemo()));
  }
}

class ListviewDemo extends StatefulWidget {
  const ListviewDemo({super.key});

  @override
  State createState() => _ListviewDemoState();
}

class _ListviewDemoState extends State {
  List imagesList = [
    "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListViewDemo"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(10),
              child: Image.network(
                  "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
            ),
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(10),
              child: Image.network(
                  "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
            ),
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(10),
              child: Image.network(
                  "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
            ),
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(10),
              child: Image.network(
                  "https://th.bing.com/th/id/OIP.8TEPRNJMAATnjxKR4UnnIQHaEz?w=301&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
            )
          ],
        ));
  }
}
