// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicConfiguration _$BasicConfigurationFromJson(Map<String, dynamic> json) {
  return BasicConfiguration(
    jiraToken: json['jiraToken'] as String,
    tempoToken: json['tempoToken'] as String,
    accountId: json['account_id'] as String,
    email: json['email'] as String,
    source: json['source'] as String,
  );
}

Map<String, dynamic> _$BasicConfigurationToJson(BasicConfiguration instance) =>
    <String, dynamic>{
      'jiraToken': instance.jiraToken,
      'tempoToken': instance.tempoToken,
      'account_id': instance.accountId,
      'email': instance.email,
      'source': instance.source,
    };
