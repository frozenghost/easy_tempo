// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fields _$FieldsFromJson(Map<String, dynamic> json) {
  return Fields(
    summary: json['summary'] as String,
    issuetype: json['issuetype'] == null
        ? null
        : Issuetype.fromJson(json['issuetype'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'summary': instance.summary,
      'issuetype': instance.issuetype,
    };
