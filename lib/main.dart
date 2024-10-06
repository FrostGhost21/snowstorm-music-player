import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audiotags/audiotags.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snowstorm_v2/class.dart';
import 'package:snowstorm_v2/db.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase database = AppDatabase();
  AudioPlayer player = AudioPlayer();
  ConcatenatingAudioSource playlist = ConcatenatingAudioSource(children: []);
  AppState appState = AppState(playlist, database, player);

  getIt.registerSingleton<List<Song>>(await appState.database.getSongs());
  getIt.registerSingleton<AppState>(appState);
  await getIt<AppState>().initPlaylist();

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
        body: body(),
      ),
    );
  }
}

Widget body() {
  List<Song> songs = getIt<List<Song>>();
  List<Widget> widgets = [];
  for (Song song in songs) {
    widgets.add(ListTile(
      leading: const Icon(Icons.abc_outlined),
      title: Text(song.name),
      onTap: () {
        //To be in line with the playlist's index, we take awawy one.
        getIt<AppState>().playSong(song.id - 1);
      },
    ));
  }
  //Creates a gridview of listtiles
  return ListView(
    children: widgets,
  );
}

void addFolder() async {
  final snowstormDB = getIt<AppState>().database;
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
