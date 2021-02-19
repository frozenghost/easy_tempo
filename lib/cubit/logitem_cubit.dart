import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_tempo/models/issue.dart';
import 'package:easy_tempo/models/log_item.dart/description.dart';
import 'package:easy_tempo/models/log_item.dart/log_date.dart';
import 'package:easy_tempo/models/log_item.dart/log_hour.dart';
import 'package:easy_tempo/models/log_item.dart/log_minute.dart';
import 'package:easy_tempo/models/log_item.dart/ticket_id.dart';
import 'package:easy_tempo/models/tempo_log_item.dart';
import 'package:easy_tempo/repository/tempoRepository.dart';
import 'package:easy_tempo/services/tempoServicesProvider.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_support/overlay_support.dart';

part 'logitem_state.dart';

class LogItemCubit extends Cubit<LogItemState> {
  LogItemCubit(this._tempoRepository)
      : super(LogItemState(
          key: '',
          summary: '',
        ));

  final TempoRepository _tempoRepository;

  void changeLogItem({
    int ticketId,
    String key,
    String summary,
    String description,
    int logHour,
    int logMinute,
    DateTime logDate,
  }) {
    LogItemState logItemState = state.copyWith(
      ticketId: ticketId == null ? state.ticketId : TicketId.dirty(ticketId),
      key: key ?? state.key,
      summary: summary ?? state.summary,
      description: description == null
          ? state.description
          : Description.dirty(description),
      logHour: logHour == null ? state.logHour : LogHour.dirty(logHour),
      logMinute:
          logMinute == null ? state.logMinute : LogMinute.dirty(logMinute),
      logDate: logDate == null ? state.logDate : LogDate.dirty(logDate),
    );

    emit(
      logItemState.copyWith(
        status: Formz.validate([
          logItemState.ticketId,
          logItemState.description,
          logItemState.logHour,
          logItemState.logMinute,
          logItemState.logDate,
        ]),
      ),
    );
  }

  Future<void> submit() async {
    int seconds = state.logHour.value * 60 * 60 + state.logMinute.value * 60;
    TempoLogItem item = TempoLogItem(
      timeSpentSeconds: seconds,
      billableSeconds: seconds,
      comment: state.description.value,
      started: DateTime(
        state.logDate.value.year,
        state.logDate.value.month,
        state.logDate.value.day,
        state.logDate.value.hour,
      ).toIso8601String(),
      issue: Issue(id: state.ticketId.value),
      originTaskId: state.ticketId.value,
      workerId: TempoServiceProvider.getCurrentAccountId(),
    );
    await _tempoRepository.submit(item);
    toast(tr('Success'));
    clearItem();
  }

  void clearItem() {
    emit(LogItemState(
      key: '',
      summary: '',
    ));
  }
}
