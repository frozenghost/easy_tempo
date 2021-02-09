part of 'logitem_cubit.dart';

class LogItemState extends Equatable {
  const LogItemState({
    this.ticketId = const TicketId.pure(),
    this.description = const Description.pure(),
    this.logHour = const LogHour.pure(),
    this.logMinute = const LogMinute.pure(),
    this.logDate = const LogDate.pure(),
    this.status = FormzStatus.pure,
    this.key,
    this.summary,
  });

  final TicketId ticketId;
  final String key;
  final String summary;
  final Description description;
  final LogHour logHour;
  final LogMinute logMinute;
  final LogDate logDate;
  final FormzStatus status;

  LogItemState copyWith({
    TicketId ticketId,
    String key,
    String summary,
    Description description,
    LogHour logHour,
    LogMinute logMinute,
    LogDate logDate,
    FormzStatus status,
  }) {
    LogItemState state = LogItemState(
      ticketId: ticketId ?? this.ticketId,
      key: key ?? this.key,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      logHour: logHour ?? this.logHour,
      logMinute: logMinute ?? this.logMinute,
      logDate: logDate ?? this.logDate,
      status: status ?? this.status,
    );

    return state;
  }

  @override
  List<Object> get props => [
        ticketId,
        key,
        summary,
        description,
        logHour,
        logMinute,
        logDate,
        status,
      ];
}
