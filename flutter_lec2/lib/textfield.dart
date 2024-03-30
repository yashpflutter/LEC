import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App Stateless",
      home: TextfieldDemo(),
    );
  }
}

class TextfieldDemo extends StatefulWidget {
  const TextfieldDemo({super.key});
  @override
  State createState() => _TextfieldDemoState();
}

class _TextfieldDemoState extends State {
  TextEditingController nameController = TextEditingController();
  //final TextEditingController = nameController;    ///error

  void _printData() {
    print("ComapnyName: ${nameController.text}");
  }

  void initState() {
    super.initState();
    // nameController.addListener(_printData);
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TextfieldDemo"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameController,
              showCursor: true,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                print("onchange: $value");
              },
              onSubmitted: (value) {
                print("on submitted:$value");
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  )),
                  hintText: "Enter company name"),
            ),
            const SizedBox(height: 30),
            TextField(),
          ],
        ));
  }
}
