import 'dart:io';

import 'package:audiotags/audiotags.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snowstorm_v2/db.dart';
part 'main.g.dart';

void main() async {
  runApp(const ProviderScope(child: SnowstormStart()));
}

class SnowstormStart extends ConsumerWidget {
  const SnowstormStart({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addFolder();
          },
          child: const Icon(Icons.folder),
        ),
        body: generateSongList(ref),
      ),
    );
  }
}

Widget generateSongList(WidgetRef ref) {
  AsyncValue body = ref.watch(bodyProvider);
  if (body.hasValue) {
    return body.value;
  }
  return const CircularProgressIndicator();
}

@riverpod
Future<Widget> body(Ref ref) async {
  List<Widget> a = [];
  final snowStormDB = AppDatabase();
  List<Song> songs = await snowStormDB.allSongs();
  for (Song song in songs) {
    a.add(Center(child: Text(song.name)));
  }
  return GridView.count(
    crossAxisCount: 2,
    children: a,
  );
}

void addFolder() async {
  final snowstormDB = AppDatabase();
  Permission.manageExternalStorage.request();
  final path = await FilePicker.platform.getDirectoryPath();
  if (path != null) {
    Directory dir = Directory(path);
    List<String> songs = await directoryList(dir);
    songs = filter(songs, "flac");
    for (String path in songs) {
      Tag? tag = await AudioTags.read(path);
      String title = tag?.title ?? path.split('/')[-1];
      snowstormDB
          .addSongs(SongsCompanion(path: Value(path), name: Value(title)));
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
