// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      json['name'] as String,
      (json['songIDs'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'name': instance.name,
      'songIDs': instance.songIDs,
    };
