import 'dart:convert';

import 'package:easy_tempo/constants/const.dart';
import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:easy_tempo/cubit/search_cubit.dart';
import 'package:easy_tempo/cubit/tabnavigation_cubit.dart';
import 'package:easy_tempo/cubit/tempoweek_cubit.dart';
import 'package:easy_tempo/cubit/settings_cubit.dart';
import 'package:easy_tempo/pages/homePage.dart';
import 'package:easy_tempo/pages/logItemPage.dart';
import 'package:easy_tempo/pages/worklogWeekSummaryPage.dart';
import 'package:easy_tempo/repository/tempoRepository.dart';
import 'package:easy_tempo/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/services.dart' show rootBundle;

class EasyTempoApp extends StatelessWidget {
  const EasyTempoApp({
    Key key,
    @required TempoRepository tempoRepository,
    String configJson,
  })  : assert(tempoRepository != null),
        _tempoRepository = tempoRepository,
        _configJson = configJson,
        super(key: key);

  final TempoRepository _tempoRepository;
  final String _configJson;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _tempoRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TempoWeekCubit(_tempoRepository),
          ),
          BlocProvider(
            create: (_) => TabNavigationCubit(),
          ),
          BlocProvider(
            create: (_) => SettingsCubit(),
          ),
          BlocProvider(
            create: (_) => LogItemCubit(_tempoRepository),
          ),
          BlocProvider(
            create: (_) => SearchCubit(_tempoRepository),
          ),
        ],
        child: EasyTempoAppView(configJson: _configJson),
      ),
    );
  }
}

class EasyTempoAppView extends StatelessWidget {
  const EasyTempoAppView({Key key, String configJson})
      : _configJson = configJson,
        super(key: key);

  final String _configJson;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> json = jsonDecode(_configJson);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        context.watch<SettingsCubit>().setConfigInfo(json);
        return OverlaySupport(
          child: MaterialApp(
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: TempoAppConst.darkTheme,
            theme: TempoAppConst.brightTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: HomePage(),
            onGenerateRoute: onGenerateRoute,
          ),
        );
      },
    );
  }
}
