// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempoweek_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempoWeekState _$TempoWeekStateFromJson(Map<String, dynamic> json) {
  return TempoWeekState(
    status: _$enumDecodeNullable(_$PageStatusEnumMap, json['status']),
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : TempoLogItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TempoWeekStateToJson(TempoWeekState instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'status': _$PageStatusEnumMap[instance.status],
      'items': instance.items,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PageStatusEnumMap = {
  PageStatus.initial: 'initial',
  PageStatus.loading: 'loading',
  PageStatus.success: 'success',
  PageStatus.failure: 'failure',
};
