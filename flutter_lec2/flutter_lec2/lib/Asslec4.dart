//Do assignment of India Flag
import 'package:flutter/material.dart';
//import 'Asslec4.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends MaterialApp {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      home: Asslec4(),
    );
  }
}*/

class Asslec4 extends StatefulWidget {
  const Asslec4({super.key});
  @override
  State<Asslec4> createState() => _Asslec4();
}

class _Asslec4 extends State<Asslec4> {
  int counter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("counter App"),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Text("Add"),
        ),
        body: SizedBox(
          //body:Container
          //color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (counter >= 0)
                  ? Container(
                      height: 500,
                      width: 20,
                      color: Colors.brown,
                    )
                  : Container(),
              Column(
                children: [
                  (counter >= 1)
                      ? Container(height: 80, width: 250, color: Colors.orange)
                      : Container(),
                  (counter >= 2)
                      ? Container(
                          color: Colors.white,
                          height: 80,
                          width: 250,
                          child: (counter >= 3)
                              ? Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY9eJ9gWX3Xm2H-Rg74iCt1ehfPe7jRwXEbw&usqp=CAU",
                                )
                              : Container(),
                        )
                      : Container(),
                  (counter >= 4)
                      ? Container(height: 80, width: 250, color: Colors.green)
                      : Container(),
                ],
              )
            ],
          ),
        ));
  }
}
