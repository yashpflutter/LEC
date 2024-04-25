//epherimaral state mangment
//complete the code from the app
//need amin .dart

import 'dart:developer';
import 'package:flutter/material.dart';

class EphemeralDemo extends StatefulWidget {
  const EphemeralDemo({super.key});
  @override
  State createState() => _EphemeralDemoState();
}

class _EphemeralDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ephemerialdemo"),
          backgroundColor: Colors.blue,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Cource(courceName: "Java"),
            SizedBox(height: 50),
            Cource(courceName: "flutter"),
            SizedBox(height: 50),
            Cource(courceName: "python"),
          ],
        ));
  }
}

class Cource extends StatefulWidget {
  final String courceName;
  const Cource({super.key, required this.courceName});

  @override
  State<StatefulWidget> createState() => _CourceState();
}

class _CourceState extends State<Cource> {
  int refrencecount = 0;
  @override
  Widget build(BuildContext context) {
    log("In CourcceState build"); //check what is this
    log(widget.courceName);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              refrencecount++;
            });
          },
          child: Container(
              alignment: Alignment.center,
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(widget.courceName)),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          alignment: Alignment.center,
          height: 70,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text("Count:$refrencecount"),
        ),
      ],
    );
  }
}
