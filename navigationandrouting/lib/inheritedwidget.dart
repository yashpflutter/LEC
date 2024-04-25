import 'package:flutter/material.dart';

//lec of the Provider lec overieew
//comlete the code

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  String companyName = "Google";
  int empcount = 250;

  @override
  Widget build(BuildContext context) {
    return Company(
        companyName: companyName,
        empcount: empcount,
        child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: const Text("Innherited Widget"),
              ),
              body: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CompanyData(),
                ],
              )),
        ));
  }
}

class CompanyData extends StatelessWidget {
  const CompanyData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Company extends InheritedWidget {
  final String companyName;
  final int empcount;
  const Company({
    super.key,
    required this.companyName,
    required this.empcount,
    required super.child,
  });

  static Company of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Company>()!;
  }

  @override
  bool updateShouldNotify(Company oldWidget) {
    return companyName != oldWidget.companyName;
  }
}
