import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'db.g.dart';

class Songs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get path => text().unique()();
  TextColumn get name => text()();
}

class Playlists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get playlists => text()();
}

class UserData extends Table {
  TextColumn get apikey => text().nullable()();
}

@DriftDatabase(tables: [Songs, Playlists, UserData])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'songs');
  }

  void addSongs(SongsCompanion song) {
    into(songs).insert(song);
  }

  void addPlaylist(PlaylistsCompanion playlist) {
    into(playlists).insert(playlist);
  }

  void addOSUKey(UserDataCompanion data) {
    into(userData).insert(data);
  }

  Future<String?> getOSUKey() async {
    List<UserDataData> futureString = await select(userData).get();
    return futureString[0].apikey;
  }

  String convertListIntIntoString(List<int> list) {
    String result = "";
    for (int value in list) {
      result = "$result.$value";
    }
    return result;
  }

  List<int> convertStringIntoListInt(String string) {
    List<int> list = [];
    for (String value in string.split('.')) {
      list.add(value as int);
    }
    return list;
  }

  Future<List<Song>> getSongs() {
    return select(songs).get();
  }
}
