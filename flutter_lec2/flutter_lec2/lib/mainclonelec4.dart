//Do assignment of India Flag
import 'package:flutter/material.dart';
//import 'Asslec4.dart';

void main() {
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
}

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
        body: Container(
          color: Colors.grey,
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
                                  "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F35%2F37%2F19%2F3537199ac5bfab8116eacdd2c69cc9c4.png&tbnid=IHIUMTBilYWQpM&vet=12ahUKEwiQnrn62LyEAxVvnmMGHZWBBQkQMygFegQIARBY..i&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F850969292089915573%2F&docid=-59nIOfJeIcC8M&w=394&h=326&q=sudarshan%20chakra%20indina%20flag&ved=2ahUKEwiQnrn62LyEAxVvnmMGHZWBBQkQMygFegQIARBY",
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
