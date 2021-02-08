import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:easy_tempo/repository/tempoRepository.dart';
import 'package:easy_tempo/services/tempoServicesProvider.dart';

import 'constants/const.dart';

void main() {
  Dio dio = Dio();
  // String url =
  //     'https://api.tempo.io/core/3/worklogs/user/${TempoAppConst.accountId}'; //'https://app.tempo.io/rest/tempo-core/1/favorites/issue/';
  // TempoServiceProvider(dio: dio)
  //     .get(url, headers)
  //     .then((response) => print(response.toString()));

  String url = 'https://app.tempo.io/rest/tempo-timesheets/4/worklogs/search';

  TempoRepository(tempoServiceProvider: TempoServiceProvider(dio: dio))
      .getRecentLoggedItem();
}
