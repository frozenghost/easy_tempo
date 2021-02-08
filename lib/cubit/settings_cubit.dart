import 'package:bloc/bloc.dart';
import 'package:easy_tempo/models/basic_configuration.dart';
import 'package:easy_tempo/services/tempoServicesProvider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings_cubit.g.dart';
part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState(isDark: false, locale: 'en-US'));

  void switchThemeMode(bool isDark) {
    emit(state.copyWith(isDark: isDark));
  }

  void setLocale(String locale) {
    emit(state.copyWith(locale: locale));
  }

  void setConfigInfo(Map<String, dynamic> json) {
    emit(state.copyWith(config: BasicConfiguration.fromJson(json)));
    TempoServiceProvider.setUserInfo(
      accountId: state.config.accountId,
      tempoToken: state.config.tempoToken,
    );
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(SettingsState state) {
    return state.toJson();
  }
}
