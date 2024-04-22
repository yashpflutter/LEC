import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Login Page"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.freepik.com%2Fpremium-vector%2Fcute-smiling-caricature-busy-coding-website-vector-illustration-cartoon_969863-835.jpg&tbnid=1eC1M460IvDNlM&vet=12ahUKEwiSmaTj9_KEAxU07TgGHXVeAJAQMygKegQIARBk..i&imgrefurl=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Favatar-developer&docid=_vU-e6H5Qt8iqM&w=626&h=626&q=avatar%20for%20devloment%20&ved=2ahUKEwiSmaTj9_KEAxU07TgGHXVeAJAQMygKegQIARBk",
                        width: 90,
                        height: 90,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: userNameTextEditingController,
                        obscureText: true, //make secuure passowrd
                        obscuringCharacter: "*", //insted of showing password
                        decoration: InputDecoration(
                            hintText: "Enter Useraname",
                            label: const Text("Enter Username"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                            )),
                        validator: (value) {
                          print("In USERNAME VALIDATION");
                          if (value == null || value.isEmpty) {
                            return "Pleasse enter username";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                        ),
                        validator: (value) {
                          print("in PASSWROD VALIDAION");
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bool loginVaildated =
                              _formKey.currentState!.validate();
                          if (loginVaildated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("LOGIN SUCCESSFUL"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Failed"),
                              ),
                            );
                          }
                        },
                        child: const Text("Login"),
                      )
                    ]))));
  }
}
