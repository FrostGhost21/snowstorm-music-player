import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => first_time(),
  ),
  GoRoute(
    path: '/local',
    builder: (context, state) => local_files(),
  ),
  GoRoute(
    path: '/jellyfin',
    builder: (context, state) => jellyfin(),
  ),
  GoRoute(path: '/jellyfin/login', builder: (context, state) => const login())
]);
void main() {
  runApp(ui_mockup());
}

class ui_mockup extends StatelessWidget {
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

class local_files extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("in local files"),
    );
  }
}

class jellyfin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("in jellyfin"),
    );
  }
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => login_state();
}

class login_state extends State<login> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class first_time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
            maintainBottomViewPadding: true,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              margin: EdgeInsets.all(MediaQuery.sizeOf(context).height / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        router.go('/local');
                      },
                      child: const Text("Local files only")),
                  Padding(
                      padding: EdgeInsets.all(
                          0.1 * MediaQuery.sizeOf(context).height)),
                  TextButton(
                      onPressed: () {
                        router.go('/jellyfin/login');
                      },
                      child: const Text("Setup Jellyfin")),
                ],
              ),
            )));
  }
}
