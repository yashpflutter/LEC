import 'package:flutter/material.dart';

class Asslec5 extends StatefulWidget {
  const Asslec5({super.key});
  @override
  State<Asslec5> createState() => _Asslec5State();
}

class _Asslec5State extends State<Asslec5> {
  bool box1color = false;
  bool box2color = false;

  // get child => null;

  Color setBox1Color() {
    if (box1color == false) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Color setBox2Color() {
    if (box2color == false) {
      return Colors.black;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    //const column = Column(width: 100, height: 100, color: Colors.red);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOOGLE COLOR BOX"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      /*  body: Column(                 //tried by me
               mainAxisAlignment: MainAxisAlignment.center,
               //SizedBox(
               //height: double.infinity,
               children: [
                 Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
               Container(
                width: 100,
                height: 100,
                color: box1color ? Colors.red : Colors.blue,
               ),
               const SizedBox(width: 50, height: 50),
               Container(height: 100, width: 100, color: Colors.blue),
               ElevatedButton(
                  onPressed: () {
                    setState(() {
                    box1color = true;
                    });
                  },
               child: const Text("ColorBox1") ),
             ],
            ),
          ],
        ),   */
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(height: 100, width: 100, color: setBox1Color()),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (box1color == false) {
                      box1color = true;
                    }
                  });
                },
                child: const Text("llll")),
          ]),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 100, width: 100, color: setBox2Color()),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (box2color == false) {
                        box2color = true;
                      }
                    });
                  },
                  child: const Text("hhh")),
            ],
          )
        ],
      ),
    );
  }
}
