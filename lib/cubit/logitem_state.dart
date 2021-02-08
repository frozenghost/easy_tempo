part of 'logitem_cubit.dart';

class LogItemState extends Equatable {
  const LogItemState({
    this.ticketId = const TicketId.pure(),
    this.description = const Description.pure(),
    this.logHour = const LogHour.pure(),
    this.logMinute = const LogMinute.pure(),
    this.logDate = const LogDate.pure(),
    this.status = FormzStatus.pure,
  });

  final TicketId ticketId;
  final Description description;
  final LogHour logHour;
  final LogMinute logMinute;
  final LogDate logDate;
  final FormzStatus status;

  LogItemState copyWith({
    TicketId ticketId,
    Description description,
    LogHour logHour,
    LogMinute logMinute,
    LogDate logDate,
    FormzStatus status,
  }) {
    LogItemState state = LogItemState(
      ticketId: ticketId ?? this.ticketId,
      description: description ?? this.description,
      logHour: logHour ?? this.logHour,
      logMinute: logMinute ?? this.logMinute,
      logDate: logDate ?? this.logDate,
      status: status ?? this.status,
    );

    return state;
  }

  @override
  List<Object> get props =>
      [ticketId, description, logHour, logMinute, logDate, status];
}
