import 'package:flutter/material.dart';
import 'package:snowstorm_v2/main.dart';

class UIMockup extends StatelessWidget {
  const UIMockup({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.deepPurple[100],
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white))),
      routerConfig: router,
    );
  }
}
