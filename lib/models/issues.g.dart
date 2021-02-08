// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issues _$IssuesFromJson(Map<String, dynamic> json) {
  return Issues(
    id: json['id'] as int,
    key: json['key'] as String,
    keyHtml: json['keyHtml'] as String,
    img: json['img'] as String,
    summary: json['summary'] as String,
    summaryText: json['summaryText'] as String,
  );
}

Map<String, dynamic> _$IssuesToJson(Issues instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'keyHtml': instance.keyHtml,
      'img': instance.img,
      'summary': instance.summary,
      'summaryText': instance.summaryText,
    };
