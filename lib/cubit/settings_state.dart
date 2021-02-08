part of 'settings_cubit.dart';

@JsonSerializable()
class SettingsState extends Equatable {
  const SettingsState({
    this.isDark,
    this.locale,
    this.config,
  });

  final bool isDark;
  final String locale;
  final BasicConfiguration config;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  SettingsState copyWith({
    bool isDark,
    String locale,
    BasicConfiguration config,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      locale: locale ?? this.locale,
      config: config ?? this.config,
    );
  }

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);

  @override
  List<Object> get props => [isDark, locale, config];
}
