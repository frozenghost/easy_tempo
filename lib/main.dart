import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_tempo/app.dart';
import 'package:easy_tempo/repository/tempoRepository.dart';
import 'package:easy_tempo/services/tempoServicesProvider.dart';
import 'package:easy_tempo/tempo_bloc_observer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = TempoBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build();
  Dio dio = Dio();
  String config = await rootBundle.loadString('data/info.json');

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: EasyTempoApp(
        tempoRepository: TempoRepository(
          tempoServiceProvider: TempoServiceProvider(
            dio: dio,
            errorCallBack: errorCallback,
          ),
        ),
        configJson: config,
      ),
    ),
  );
}

Function errorCallback = (Response response) {
  print(response.toString());
};
