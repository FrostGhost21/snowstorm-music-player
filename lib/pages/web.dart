import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:snowstorm_v2/class.dart';
import 'package:snowstorm_v2/db.dart';
import 'package:drift/drift.dart';

final getIt = GetIt.instance;

Widget network() {
  return ListView(
    children: [
      TextField(
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "osu!api key"),
        onSubmitted: (String key) {
          getIt<AppState>()
              .database
              .addOSUKey(UserDataCompanion(apikey: Value(key)));
        },
      ),
      ListView.builder(itemBuilder: (context, index) {})
    ],
  );
}
