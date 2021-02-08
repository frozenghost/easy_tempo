import 'package:bloc/bloc.dart';
import 'package:easy_tempo/models/log_item.dart/description.dart';
import 'package:easy_tempo/models/log_item.dart/log_date.dart';
import 'package:easy_tempo/models/log_item.dart/log_hour.dart';
import 'package:easy_tempo/models/log_item.dart/log_minute.dart';
import 'package:easy_tempo/models/tempo_log_item.dart';
import 'package:easy_tempo/repository/tempoRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logitem_state.dart';

class LogItemCubit extends Cubit<LogItemState> {
  LogItemCubit(this._tempoRepository) : super(LogItemState());

  final TempoRepository _tempoRepository;

  LogItemState changeLogItem({
    int ticketId,
    String description,
    int logHour,
    int logMinute,
    DateTime logDate,
  }) {
    LogItemState logItemState = state.copyWith(
      description: description == null
          ? state.description
          : Description.dirty(description),
      logHour: logHour == null ? state.logHour : LogHour.dirty(logHour),
      logMinute:
          logMinute == null ? state.logMinute : LogMinute.dirty(logMinute),
      logDate: logDate == null ? state.logDate : LogDate.dirty(logDate),
    );

    return logItemState.copyWith(
      status: Formz.validate([
        logItemState.description,
        logItemState.logHour,
        logItemState.logMinute,
        logItemState.logDate,
      ]),
    );
  }
}
