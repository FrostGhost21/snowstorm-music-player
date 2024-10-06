// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $SongsTable extends Songs with TableInfo<$SongsTable, Song> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, path, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'songs';
  @override
  VerificationContext validateIntegrity(Insertable<Song> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Song map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Song(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SongsTable createAlias(String alias) {
    return $SongsTable(attachedDatabase, alias);
  }
}

class Song extends DataClass implements Insertable<Song> {
  final int id;
  final String path;
  final String name;
  const Song({required this.id, required this.path, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['path'] = Variable<String>(path);
    map['name'] = Variable<String>(name);
    return map;
  }

  SongsCompanion toCompanion(bool nullToAbsent) {
    return SongsCompanion(
      id: Value(id),
      path: Value(path),
      name: Value(name),
    );
  }

  factory Song.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Song(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String>(json['path']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String>(path),
      'name': serializer.toJson<String>(name),
    };
  }

  Song copyWith({int? id, String? path, String? name}) => Song(
        id: id ?? this.id,
        path: path ?? this.path,
        name: name ?? this.name,
      );
  Song copyWithCompanion(SongsCompanion data) {
    return Song(
      id: data.id.present ? data.id.value : this.id,
      path: data.path.present ? data.path.value : this.path,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Song(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, path, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song &&
          other.id == this.id &&
          other.path == this.path &&
          other.name == this.name);
}

class SongsCompanion extends UpdateCompanion<Song> {
  final Value<int> id;
  final Value<String> path;
  final Value<String> name;
  const SongsCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.name = const Value.absent(),
  });
  SongsCompanion.insert({
    this.id = const Value.absent(),
    required String path,
    required String name,
  })  : path = Value(path),
        name = Value(name);
  static Insertable<Song> custom({
    Expression<int>? id,
    Expression<String>? path,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
      if (name != null) 'name': name,
    });
  }

  SongsCompanion copyWith(
      {Value<int>? id, Value<String>? path, Value<String>? name}) {
    return SongsCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PlaylistsTable extends Playlists
    with TableInfo<$PlaylistsTable, Playlist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _playlistsMeta =
      const VerificationMeta('playlists');
  @override
  late final GeneratedColumn<String> playlists = GeneratedColumn<String>(
      'playlists', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, playlists];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlists';
  @override
  VerificationContext validateIntegrity(Insertable<Playlist> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlists')) {
      context.handle(_playlistsMeta,
          playlists.isAcceptableOrUnknown(data['playlists']!, _playlistsMeta));
    } else if (isInserting) {
      context.missing(_playlistsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Playlist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Playlist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      playlists: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlists'])!,
    );
  }

  @override
  $PlaylistsTable createAlias(String alias) {
    return $PlaylistsTable(attachedDatabase, alias);
  }
}

class Playlist extends DataClass implements Insertable<Playlist> {
  final int id;
  final String playlists;
  const Playlist({required this.id, required this.playlists});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlists'] = Variable<String>(playlists);
    return map;
  }

  PlaylistsCompanion toCompanion(bool nullToAbsent) {
    return PlaylistsCompanion(
      id: Value(id),
      playlists: Value(playlists),
    );
  }

  factory Playlist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Playlist(
      id: serializer.fromJson<int>(json['id']),
      playlists: serializer.fromJson<String>(json['playlists']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlists': serializer.toJson<String>(playlists),
    };
  }

  Playlist copyWith({int? id, String? playlists}) => Playlist(
        id: id ?? this.id,
        playlists: playlists ?? this.playlists,
      );
  Playlist copyWithCompanion(PlaylistsCompanion data) {
    return Playlist(
      id: data.id.present ? data.id.value : this.id,
      playlists: data.playlists.present ? data.playlists.value : this.playlists,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Playlist(')
          ..write('id: $id, ')
          ..write('playlists: $playlists')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playlists);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Playlist &&
          other.id == this.id &&
          other.playlists == this.playlists);
}

class PlaylistsCompanion extends UpdateCompanion<Playlist> {
  final Value<int> id;
  final Value<String> playlists;
  const PlaylistsCompanion({
    this.id = const Value.absent(),
    this.playlists = const Value.absent(),
  });
  PlaylistsCompanion.insert({
    this.id = const Value.absent(),
    required String playlists,
  }) : playlists = Value(playlists);
  static Insertable<Playlist> custom({
    Expression<int>? id,
    Expression<String>? playlists,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlists != null) 'playlists': playlists,
    });
  }

  PlaylistsCompanion copyWith({Value<int>? id, Value<String>? playlists}) {
    return PlaylistsCompanion(
      id: id ?? this.id,
      playlists: playlists ?? this.playlists,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlists.present) {
      map['playlists'] = Variable<String>(playlists.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistsCompanion(')
          ..write('id: $id, ')
          ..write('playlists: $playlists')
          ..write(')'))
        .toString();
  }
}

class $UserDataTable extends UserData
    with TableInfo<$UserDataTable, UserDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _apikeyMeta = const VerificationMeta('apikey');
  @override
  late final GeneratedColumn<String> apikey = GeneratedColumn<String>(
      'apikey', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [apikey];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_data';
  @override
  VerificationContext validateIntegrity(Insertable<UserDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('apikey')) {
      context.handle(_apikeyMeta,
          apikey.isAcceptableOrUnknown(data['apikey']!, _apikeyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDataData(
      apikey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}apikey']),
    );
  }

  @override
  $UserDataTable createAlias(String alias) {
    return $UserDataTable(attachedDatabase, alias);
  }
}

class UserDataData extends DataClass implements Insertable<UserDataData> {
  final String? apikey;
  const UserDataData({this.apikey});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || apikey != null) {
      map['apikey'] = Variable<String>(apikey);
    }
    return map;
  }

  UserDataCompanion toCompanion(bool nullToAbsent) {
    return UserDataCompanion(
      apikey:
          apikey == null && nullToAbsent ? const Value.absent() : Value(apikey),
    );
  }

  factory UserDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDataData(
      apikey: serializer.fromJson<String?>(json['apikey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'apikey': serializer.toJson<String?>(apikey),
    };
  }

  UserDataData copyWith({Value<String?> apikey = const Value.absent()}) =>
      UserDataData(
        apikey: apikey.present ? apikey.value : this.apikey,
      );
  UserDataData copyWithCompanion(UserDataCompanion data) {
    return UserDataData(
      apikey: data.apikey.present ? data.apikey.value : this.apikey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDataData(')
          ..write('apikey: $apikey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => apikey.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataData && other.apikey == this.apikey);
}

class UserDataCompanion extends UpdateCompanion<UserDataData> {
  final Value<String?> apikey;
  final Value<int> rowid;
  const UserDataCompanion({
    this.apikey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserDataCompanion.insert({
    this.apikey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<UserDataData> custom({
    Expression<String>? apikey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (apikey != null) 'apikey': apikey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserDataCompanion copyWith({Value<String?>? apikey, Value<int>? rowid}) {
    return UserDataCompanion(
      apikey: apikey ?? this.apikey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (apikey.present) {
      map['apikey'] = Variable<String>(apikey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataCompanion(')
          ..write('apikey: $apikey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SongsTable songs = $SongsTable(this);
  late final $PlaylistsTable playlists = $PlaylistsTable(this);
  late final $UserDataTable userData = $UserDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [songs, playlists, userData];
}

typedef $$SongsTableCreateCompanionBuilder = SongsCompanion Function({
  Value<int> id,
  required String path,
  required String name,
});
typedef $$SongsTableUpdateCompanionBuilder = SongsCompanion Function({
  Value<int> id,
  Value<String> path,
  Value<String> name,
});

class $$SongsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SongsTable> {
  $$SongsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SongsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SongsTable> {
  $$SongsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$SongsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SongsTable,
    Song,
    $$SongsTableFilterComposer,
    $$SongsTableOrderingComposer,
    $$SongsTableCreateCompanionBuilder,
    $$SongsTableUpdateCompanionBuilder,
    (Song, BaseReferences<_$AppDatabase, $SongsTable, Song>),
    Song,
    PrefetchHooks Function()> {
  $$SongsTableTableManager(_$AppDatabase db, $SongsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SongsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SongsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              SongsCompanion(
            id: id,
            path: path,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String path,
            required String name,
          }) =>
              SongsCompanion.insert(
            id: id,
            path: path,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SongsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SongsTable,
    Song,
    $$SongsTableFilterComposer,
    $$SongsTableOrderingComposer,
    $$SongsTableCreateCompanionBuilder,
    $$SongsTableUpdateCompanionBuilder,
    (Song, BaseReferences<_$AppDatabase, $SongsTable, Song>),
    Song,
    PrefetchHooks Function()>;
typedef $$PlaylistsTableCreateCompanionBuilder = PlaylistsCompanion Function({
  Value<int> id,
  required String playlists,
});
typedef $$PlaylistsTableUpdateCompanionBuilder = PlaylistsCompanion Function({
  Value<int> id,
  Value<String> playlists,
});

class $$PlaylistsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PlaylistsTable> {
  $$PlaylistsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get playlists => $state.composableBuilder(
      column: $state.table.playlists,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PlaylistsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PlaylistsTable> {
  $$PlaylistsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get playlists => $state.composableBuilder(
      column: $state.table.playlists,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$PlaylistsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlaylistsTable,
    Playlist,
    $$PlaylistsTableFilterComposer,
    $$PlaylistsTableOrderingComposer,
    $$PlaylistsTableCreateCompanionBuilder,
    $$PlaylistsTableUpdateCompanionBuilder,
    (Playlist, BaseReferences<_$AppDatabase, $PlaylistsTable, Playlist>),
    Playlist,
    PrefetchHooks Function()> {
  $$PlaylistsTableTableManager(_$AppDatabase db, $PlaylistsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PlaylistsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PlaylistsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> playlists = const Value.absent(),
          }) =>
              PlaylistsCompanion(
            id: id,
            playlists: playlists,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String playlists,
          }) =>
              PlaylistsCompanion.insert(
            id: id,
            playlists: playlists,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlaylistsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlaylistsTable,
    Playlist,
    $$PlaylistsTableFilterComposer,
    $$PlaylistsTableOrderingComposer,
    $$PlaylistsTableCreateCompanionBuilder,
    $$PlaylistsTableUpdateCompanionBuilder,
    (Playlist, BaseReferences<_$AppDatabase, $PlaylistsTable, Playlist>),
    Playlist,
    PrefetchHooks Function()>;
typedef $$UserDataTableCreateCompanionBuilder = UserDataCompanion Function({
  Value<String?> apikey,
  Value<int> rowid,
});
typedef $$UserDataTableUpdateCompanionBuilder = UserDataCompanion Function({
  Value<String?> apikey,
  Value<int> rowid,
});

class $$UserDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableFilterComposer(super.$state);
  ColumnFilters<String> get apikey => $state.composableBuilder(
      column: $state.table.apikey,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableOrderingComposer(super.$state);
  ColumnOrderings<String> get apikey => $state.composableBuilder(
      column: $state.table.apikey,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserDataTable,
    UserDataData,
    $$UserDataTableFilterComposer,
    $$UserDataTableOrderingComposer,
    $$UserDataTableCreateCompanionBuilder,
    $$UserDataTableUpdateCompanionBuilder,
    (UserDataData, BaseReferences<_$AppDatabase, $UserDataTable, UserDataData>),
    UserDataData,
    PrefetchHooks Function()> {
  $$UserDataTableTableManager(_$AppDatabase db, $UserDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String?> apikey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDataCompanion(
            apikey: apikey,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String?> apikey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDataCompanion.insert(
            apikey: apikey,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserDataTable,
    UserDataData,
    $$UserDataTableFilterComposer,
    $$UserDataTableOrderingComposer,
    $$UserDataTableCreateCompanionBuilder,
    $$UserDataTableUpdateCompanionBuilder,
    (UserDataData, BaseReferences<_$AppDatabase, $UserDataTable, UserDataData>),
    UserDataData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SongsTableTableManager get songs =>
      $$SongsTableTableManager(_db, _db.songs);
  $$PlaylistsTableTableManager get playlists =>
      $$PlaylistsTableTableManager(_db, _db.playlists);
  $$UserDataTableTableManager get userData =>
      $$UserDataTableTableManager(_db, _db.userData);
}
