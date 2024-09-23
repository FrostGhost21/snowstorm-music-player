import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'db.g.dart';

class Songs extends Table {
  TextColumn get path => text()();
  TextColumn get name => text()();
}

@DriftDatabase(tables: [Songs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'songs');
  }

  void addSongs(SongsCompanion entry) {
    into(songs).insert(entry);
  }

  Future<List<Song>> allSongs() {
    return select(songs).get();
  }
}
