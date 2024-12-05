import 'package:flutter/material.dart';
import 'package:snowstorm_v2/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 62.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a Jellyfin Server URL";
                    //add proper validation later
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(labelText: "Jellyfin Server URL"),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 62),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextFormField(
                    validator: (value) {
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Username"),
                  )),
                  Expanded(
                      child: TextFormField(
                    validator: (value) {
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                  )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 62),
              child: ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      router.go("/jellyfin");
                    }
                  },
                  child: const Text("Login")),
            ),
          ],
        ),
      ),
    );
  }
}
