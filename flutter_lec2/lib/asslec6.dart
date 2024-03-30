import 'package:flutter/material.dart';

class Asslec6 extends StatefulWidget {
  const Asslec6({super.key});

  @override
  State<Asslec6> createState() => _Asslec6State();
}

class _Asslec6State extends State<Asslec6> {
  int counter = 0;
  int count = 0;
  Color setColor1box() {
    if (counter == 0) {
      return Colors.blue;
    } else if (counter == 1) {
      return Colors.green;
    } else if (counter == 2) {
      return Colors.red;
    } else if (counter > 2) {
      counter = 0;
    }
    return Colors.black;
  }

  Color setColor2box() {
    if (count == 0) {
      return Colors.indigo;
    } else if (count == 1) {
      return Colors.grey;
    } else if (count == 2) {
      return Colors.purple;
    } else if (count > 2) {
      count = 0;
    }
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Toogle Box 2"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 100, height: 100, color: setColor1box()),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: const Text("Button1")),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 100, height: 100, color: setColor2box()),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      count++;
                    },
                  );
                },
                child: const Text("Button2")),
          ]),
        ]));
  }
}
