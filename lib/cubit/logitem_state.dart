part of 'logitem_cubit.dart';

class LogItemState extends Equatable {
  const LogItemState({
    this.description = const Description.pure(),
    this.logHour = const LogHour.pure(),
    this.logMinute = const LogMinute.pure(),
    this.logDate = const LogDate.pure(),
    this.status = FormzStatus.pure,
  });

  final Description description;
  final LogHour logHour;
  final LogMinute logMinute;
  final LogDate logDate;
  final FormzStatus status;

  LogItemState copyWith({
    Description description,
    LogHour logHour,
    LogMinute logMinute,
    LogDate logDate,
    FormzStatus status,
  }) {
    LogItemState state = LogItemState(
      description: description ?? this.description,
      logHour: logHour ?? this.logHour,
      logMinute: logMinute ?? this.logMinute,
      logDate: logDate ?? this.logDate,
      status: status ?? this.status,
    );

    return state;
  }

  @override
  List<Object> get props => [description, logHour, logMinute, logDate, status];
}
