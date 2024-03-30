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
        body: SizedBox(
          height: double.infinity,
          //width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 100, width: 100, color: Colors.red),
              const SizedBox(height: 20, width: 20),
              Container(height: 100, width: 100, color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
