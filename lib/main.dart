import 'dart:io';

import 'package:audiotags/audiotags.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqlite3/sqlite3.dart';

void main() async {
  runApp(const MaterialApp(home: SnowstormStart()));
}

class SnowstormStart extends StatelessWidget {
  const SnowstormStart({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFolder();
        },
        child: const Icon(Icons.folder),
      ),
    );
  }
}

void addFolder() async {
  final Directory appDocs = await getApplicationCacheDirectory();
  final snowstormDB = sqlite3.open("${appDocs.path}/snowstorm.db");
  snowstormDB.execute('''
  CREATE TABLE IF NOT EXISTS songs (
    path STRING NOT NULL PRIMARY KEY,
    name TEXT NOT NULL);
''');
  Permission.manageExternalStorage.request();
  final path = await FilePicker.platform.getDirectoryPath();
  if (path != null) {
    Directory dir = Directory(path);
    List<String> songs = await directoryList(dir);
    songs = filter(songs, "flac");
    for (String path in songs) {
      Tag? tag = await AudioTags.read(path);
      String title = tag?.title ?? path.split('/')[-1];
      //TODOL insert into snowstormDB
    }
  }
}

Future<List<String>> directoryList(Directory dir) async {
  List<String> files = [];
  await for (FileSystemEntity file in dir.list(recursive: true)) {
    files.add(file.path);
  }
  return files;
}

List<String> filter(List<String> list, String ext) {
  List<String> result = [];
  for (String item in list) {
    if (item.endsWith(ext)) {
      result.add(item);
    }
  }
  return result;
}
