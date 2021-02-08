// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issuetype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issuetype _$IssuetypeFromJson(Map<String, dynamic> json) {
  return Issuetype(
    self: json['self'] as String,
    id: json['id'] as String,
    description: json['description'] as String,
    iconUrl: json['iconUrl'] as String,
    name: json['name'] as String,
    subtask: json['subtask'] as bool,
    avatarId: json['avatarId'] as int,
  );
}

Map<String, dynamic> _$IssuetypeToJson(Issuetype instance) => <String, dynamic>{
      'self': instance.self,
      'id': instance.id,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'name': instance.name,
      'subtask': instance.subtask,
      'avatarId': instance.avatarId,
    };
