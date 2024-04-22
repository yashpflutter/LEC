import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slider_button/slider_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: dominospage(),
    );
  }
}

class dominospage extends StatefulWidget {
  const dominospage({super.key});
  @override
  State createState() => _dominospageState();
}

class _dominospageState extends State {
  @override
  Widget build(BuildContext context) {
    return retfirstscreen();
  }

  String address = "Indurtial area,sector 62,Noida";
  List<ordermodalclass> orderList = [
    ordermodalclass(
        mode: "Dilivery",
        menu: "mar,chi,farm,farm",
        bill: 500.40,
        custName: "Rahul",
        mobNumber: 9433328371,
        address: "address"),
  ];
  bool? dilivery, drivein, takeaway = false;
  bool home = false;
  bool pressed = false;

  Scaffold retfirstscreen() {
    if (home == true) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Text("order"),
          ),
          appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('''Deliver to :
$address''',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz_outlined, color: Colors.white)),
              actions: [
                OutlinedButton(
                    style: ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    child: const Text("Change",
                        style: TextStyle(color: Colors.white)))
              ]),
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: dilivery,
                          tristate: true,
                          onChanged: (newvalue) {
                            setState(() {
                              dilivery = newvalue;
                              takeaway = false;
                              drivein = false;
                            });
                          }),
                      const Text("Dilevery"),
                      Checkbox(
                          value: drivein,
                          tristate: true,
                          onChanged: (newvalue) {
                            setState(() {
                              drivein = newvalue;
                              dilivery = false;
                              takeaway = false;
                            });
                          }),
                      const Text("Drive-in"),
                      Checkbox(
                          value: takeaway,
                          tristate: true,
                          onChanged: (newvalue) {
                            setState(() {
                              takeaway = newvalue;
                              dilivery = false;
                              drivein = false;
                            });
                          }),
                      const Text("Drive-in"),
                      Spacer(flex: 1),
                      const Text("NonVeg"),
                      SliderButton(
                        action: () async {
                          return true;
                        },
                        label: Text("Slide to choose Veg only"),
                        icon: Center(),
                        width: 230,
                        radius: 10,
                        buttonColor: Colors.green,
                      ),
                      const Text("Veg"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text("Explore Menu",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Container(
                width: 500,
                height: 300,
                child: ListView(
                  children: [
                    Image.asset(
                      "assets/farm.jpeg",
                    ),
                    Image.asset("assets/chi.jpeg"),
                    Image.asset("assets/pan.jpeg"),
                    Image.asset("assets/tom.jpeg"),
                    Image.asset("assets/mar.jpeg"),
                    Image.asset("assets/oni.jpeg")
                  ],
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 30),
              const Text("Your Orders"),
              Container(
                  width: 500,
                  height: 300,
                  child: ListView.builder(
                      itemCount: orderList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Container(
                              height: 112,
                              width: 330,
                            ));
                      }))
            ],
          )));
    } else {
      return Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("assets/download.jpeg"),
              SizedBox(
                width: 20,
                child:
                    CupertinoActivityIndicator(color: Colors.red, radius: 23.22
                        //  radius: sqrt1_2,
                        ),
              ),
              SizedBox(height: 20),
              FloatingActionButton(
                  onPressed: () {
                    home = true;
                    pressed = true;
                    if (home == true) {
                      setState(() {});
                    }
                  },
                  child: const Text("login")),
            ]),
          ));
    }
  }
}

class ordermodalclass {
  int? orderno;
  String mode;
  String menu;
  double bill;
  String custName;
  int mobNumber;
  String address;
  ordermodalclass({
    this.orderno,
    required this.mode,
    required this.menu,
    required this.bill,
    required this.custName,
    required this.mobNumber,
    required this.address,
  });
}
