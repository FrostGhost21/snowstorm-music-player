import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowstorm_v2/main.dart';

class UIMockup extends ConsumerWidget {
  const UIMockup({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
