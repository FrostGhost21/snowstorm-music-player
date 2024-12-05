import 'package:flutter/material.dart';
import 'package:snowstorm_v2/main.dart';

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
