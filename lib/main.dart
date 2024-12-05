import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const FirstTime(),
  ),
  GoRoute(
    path: '/local/setup',
    builder: (context, state) => const LocalFiles(),
  ),
  GoRoute(
    path: '/jellyfin',
    builder: (context, state) => const Jellyfin(),
  ),
  GoRoute(path: '/jellyfin/login', builder: (context, state) => const Login())
]);
void main() {
  runApp(const UIMockup());
}

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

class LocalFiles extends StatelessWidget {
  const LocalFiles({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add a folder"),
              onTap: () {},
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22))),
            ),
          )
        ],
      ),
    );
  }
}

class Jellyfin extends StatelessWidget {
  const Jellyfin({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("in jellyfin"),
    );
  }
}

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

class FirstTime extends StatelessWidget {
  const FirstTime({super.key});

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
              Center(
                child: TextButton(
                    onPressed: () {
                      router.go("/local/setup");
                    },
                    child: const Text("Use local files")),
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
