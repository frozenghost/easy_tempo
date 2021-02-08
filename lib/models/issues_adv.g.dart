// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_adv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssuesAdv _$IssuesAdvFromJson(Map<String, dynamic> json) {
  return IssuesAdv(
    expand: json['expand'] as String,
    id: json['id'] as String,
    self: json['self'] as String,
    key: json['key'] as String,
    fields: json['fields'] == null
        ? null
        : Fields.fromJson(json['fields'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IssuesAdvToJson(IssuesAdv instance) => <String, dynamic>{
      'expand': instance.expand,
      'id': instance.id,
      'self': instance.self,
      'key': instance.key,
      'fields': instance.fields,
    };
