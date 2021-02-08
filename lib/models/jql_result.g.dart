// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jql_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JqlResult _$JqlResultFromJson(Map<String, dynamic> json) {
  return JqlResult(
    sections: (json['sections'] as List)
        ?.map((e) =>
            e == null ? null : Sections.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JqlResultToJson(JqlResult instance) => <String, dynamic>{
      'sections': instance.sections,
    };
