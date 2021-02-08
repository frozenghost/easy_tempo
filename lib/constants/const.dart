import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempoAppConst {
  // static const jiraToken = '';

  static Map<int, String> weekDays = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday'
  };

  static List<String> supportedLanguages = ['en-US', 'zh-CN'];
  static List<String> supportedLanguagesDescription = ['English', '简体中文'];

  static final ThemeData brightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.orange.shade600,
    accentColor: Colors.blue.shade400,
    backgroundColor: Colors.white,
    disabledColor: Colors.grey,
    textTheme: GoogleFonts.openSansTextTheme(),
    accentTextTheme: GoogleFonts.montserratTextTheme(),
    floatingActionButtonTheme: ThemeData.light()
        .floatingActionButtonTheme
        .copyWith(backgroundColor: Colors.blue.shade400),
    bottomNavigationBarTheme: ThemeData.light()
        .bottomNavigationBarTheme
        .copyWith(
          unselectedIconTheme: IconThemeData(color: Colors.orange.shade200),
          unselectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 10.0, color: Colors.orange.shade200),
          selectedIconTheme: IconThemeData(color: Colors.deepOrange.shade300),
          selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 10.0,
              color: Colors.deepOrange.shade300,
              fontWeight: FontWeight.bold),
        ),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme:
              GoogleFonts.openSansTextTheme(Typography.blackRedmond).copyWith(
            headline6: GoogleFonts.openSans(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.tealAccent.shade400,
    accentColor: Colors.blue.shade300,
    disabledColor: Colors.grey[350],
    textTheme: GoogleFonts.openSansTextTheme(Typography.whiteRedmond),
    accentTextTheme: GoogleFonts.montserratTextTheme(Typography.whiteRedmond),
    floatingActionButtonTheme: ThemeData.dark()
        .floatingActionButtonTheme
        .copyWith(backgroundColor: Colors.blue.shade300),
    bottomNavigationBarTheme: ThemeData.dark()
        .bottomNavigationBarTheme
        .copyWith(
          backgroundColor: ThemeData.dark().backgroundColor,
          unselectedIconTheme: IconThemeData(color: Colors.teal.shade100),
          unselectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 10.0, color: Colors.teal.shade100),
          selectedIconTheme: IconThemeData(color: Colors.tealAccent.shade400),
          selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 10.0,
              color: Colors.tealAccent.shade400,
              fontWeight: FontWeight.bold),
        ),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          color: ThemeData.dark().scaffoldBackgroundColor,
          textTheme:
              GoogleFonts.openSansTextTheme(Typography.whiteRedmond).copyWith(
            headline6: GoogleFonts.openSans(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
  );
}
