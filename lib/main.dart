import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => first_time(),
  ),
  GoRoute(
    path: '/local/setup',
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text("Add a folder"),
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22))),
            ),
            padding: EdgeInsets.symmetric(horizontal: 22.0),
          )
        ],
      ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).height * 0.1),
                child: const Center(
                  child: Text(
                      style: TextStyle(fontSize: 19.0, color: Colors.brown),
                      "You can choose between using Local files or a Jellyfin instamce. You can always add more later."),
                ),
              ),
              Container(
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        router.go("/local/setup");
                        ;
                      },
                      child: const Text("Use local files")),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).height * 0.1),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      router.go("/jellyfin/login");
                    },
                    child: const Text("Use Jellyfin"),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
