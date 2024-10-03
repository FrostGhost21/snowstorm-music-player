import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as j;

part 'types.g.dart';

@j.JsonSerializable()
class Playlist {
  String name;
  List<int> songIDs;
  Playlist(this.name, this.songIDs);
  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}

class PlaylistConverter extends TypeConverter<Playlist, String> {
  const PlaylistConverter();
  @override
  Playlist fromSql(String fromDb) {
    return Playlist.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Playlist value) {
    return json.encode(value.toJson());
  }
}
