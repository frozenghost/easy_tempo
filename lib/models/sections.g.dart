// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sections _$SectionsFromJson(Map<String, dynamic> json) {
  return Sections(
    label: json['label'] as String,
    sub: json['sub'] as String,
    id: json['id'] as String,
    issues: (json['issues'] as List)
        ?.map((e) =>
            e == null ? null : Issues.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SectionsToJson(Sections instance) => <String, dynamic>{
      'label': instance.label,
      'sub': instance.sub,
      'id': instance.id,
      'issues': instance.issues,
    };
