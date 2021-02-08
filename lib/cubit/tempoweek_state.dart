part of 'tempoweek_cubit.dart';

enum PageStatus { initial, loading, success, failure }

extension PageStatusX on PageStatus {
  bool get isInitial => this == PageStatus.initial;
  bool get isLoading => this == PageStatus.loading;
  bool get isSuccess => this == PageStatus.success;
  bool get isFailure => this == PageStatus.failure;
}

@JsonSerializable()
class TempoWeekState extends Equatable {
  const TempoWeekState({
    this.status = PageStatus.initial,
    @required this.date,
    this.items,
  });

  factory TempoWeekState.fromJson(Map<String, dynamic> json) =>
      _$TempoWeekStateFromJson(json);

  final DateTime date;
  final PageStatus status;
  final List<TempoLogItem> items;

  TempoWeekState copyWith({
    DateTime date,
    PageStatus status,
    List<TempoLogItem> items,
  }) {
    return TempoWeekState(
      date: date ?? this.date,
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toJson() => _$TempoWeekStateToJson(this);

  @override
  List<Object> get props => [date, status, items];
}
