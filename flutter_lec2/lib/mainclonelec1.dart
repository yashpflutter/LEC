import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App Stateless",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stateless Widget"),
          centerTitle: true,
          actions: const [
            Icon(Icons.notifications),
            Icon(Icons.favorite),
          ],
        ),
        body: const Center(
          widthFactor: 50,
          heightFactor: 50,
          child: Text(
            "Flutter_App",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
