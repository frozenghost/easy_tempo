import 'package:date_format/date_format.dart';
import 'package:easy_tempo/models/tempo_log_item.dart';
import 'package:easy_tempo/repository/tempoRepository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'tempoweek_cubit.g.dart';
part 'tempoweek_state.dart';

class TempoWeekCubit extends HydratedCubit<TempoWeekState> {
  TempoWeekCubit(this._tempoRepository)
      : super(TempoWeekState(date: DateTime.now()));

  final TempoRepository _tempoRepository;

  Future<void> changeCurrentDate(DateTime date) async {
    emit(state.copyWith(status: PageStatus.success, date: date));
    await getWorkLogs();
  }

  Future<void> getWorkLogs() async {
    DateTime date = state.date;
    emit(state.copyWith(status: PageStatus.loading));

    try {
      final worklogItems = await _tempoRepository.getWorkLogByDay(date);

      emit(
        state.copyWith(
            date: date, status: PageStatus.success, items: worklogItems),
      );
    } catch (error) {
      emit(state.copyWith(status: PageStatus.failure));
      print(error);
    }
  }

  Future<void> deleteWorklog(int logItemId) async {
    emit(state.copyWith(status: PageStatus.loading));

    await _tempoRepository.deleteWorklogItem(logItemId);
    if (formatDate(DateTime.now(), [yyyy, mm, dd]) ==
        formatDate(state.date, [yyyy, mm, dd])) {
      await refreshWorklog();
    }
  }

  Future<void> copyWorklogToToday(TempoLogItem item) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      TempoLogItem result = await _tempoRepository.copyToToday(item);
      emit(
        state.copyWith(
          status: PageStatus.success,
        ),
      );
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(status: PageStatus.failure));
    }

    if (formatDate(DateTime.now(), [yyyy, mm, dd]) ==
        formatDate(state.date, [yyyy, mm, dd])) {
      await refreshWorklog();
    }
  }

  Future<void> refreshWorklog() async {
    try {
      final worklogItems = await _tempoRepository.getWorkLogByDay(state.date);

      emit(
        state.copyWith(
          date: state.date,
          status: PageStatus.success,
          items: worklogItems,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  @override
  TempoWeekState fromJson(Map<String, dynamic> json) {
    return TempoWeekState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TempoWeekState state) {
    return state.toJson();
  }
}
