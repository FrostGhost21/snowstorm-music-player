import 'package:flutter/material.dart';

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
