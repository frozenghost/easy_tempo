// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) {
  return SettingsState(
    isDark: json['isDark'] as bool,
    locale: json['locale'] as String,
    config: json['config'] == null
        ? null
        : BasicConfiguration.fromJson(json['config'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SettingsStateToJson(SettingsState instance) =>
    <String, dynamic>{
      'isDark': instance.isDark,
      'locale': instance.locale,
      'config': instance.config,
    };
