import 'package:easy_tempo/cubit/settings_cubit.dart';
import 'package:easy_tempo/pages/homePage.dart';
import 'package:easy_tempo/pages/languagePage.dart';
import 'package:easy_tempo/pages/logItemPage.dart';
import 'package:easy_tempo/pages/ticketSearchPage.dart';
import 'package:easy_tempo/pages/timeSheetPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Function onGenerateRoute = (RouteSettings settings) {
  var routes = <String, WidgetBuilder>{
    "/timesheet": (ctx) => TimeSheetPage(),
    "/settings/language": (ctx) => LanguagePage(),
    "/newitem": (_) => LogItemPage(),
    "/": (ctx) => HomePage(),
  };
  WidgetBuilder builder = routes[settings.name];
  return MaterialPageRoute(builder: (ctx) => builder(ctx));
};
