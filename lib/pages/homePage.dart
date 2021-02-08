import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_tempo/cubit/tabnavigation_cubit.dart';
import 'package:easy_tempo/pages/settingsPage.dart';
import 'package:easy_tempo/pages/sprintPage.dart';
import 'package:easy_tempo/pages/timeSheetPage.dart';
import 'package:easy_tempo/pages/worklogWeekSummaryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<IconData, String> navigationIcons = {
    FontAwesomeIcons.calendarCheck: 'MyWork',
    FontAwesomeIcons.fileContract: 'Timesheet',
    FontAwesomeIcons.running: 'MySprint',
    FontAwesomeIcons.cogs: 'Settings'
  };
  final List<Widget> tabViews = [
    WorklogWeekSummaryPage(),
    TimeSheetPage(),
    SprintPage(),
    SettingsPage(),
  ];

  PageController _pageViewController; // = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabNavigationCubit, TabNavigationState>(
        builder: (context, state) {
      BottomNavigationBarThemeData bottomNavigationBarThemeData =
          Theme.of(context).bottomNavigationBarTheme;
      if (_pageViewController == null) {
        _pageViewController = PageController(initialPage: state.tabIndex);
      }
      return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade300
            : Theme.of(context).scaffoldBackgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newitem');
          },
          child: Icon(
            FontAwesomeIcons.plus,
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: bottomNavigationBarThemeData.backgroundColor,
          itemCount: navigationIcons.length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(navigationIcons.keys.elementAt(index),
                    size: 24,
                    color: isActive
                        ? bottomNavigationBarThemeData.selectedIconTheme?.color
                        : bottomNavigationBarThemeData
                            .unselectedIconTheme?.color),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    navigationIcons.values.elementAt(index),
                    maxLines: 1,
                    style: isActive
                        ? bottomNavigationBarThemeData.selectedLabelStyle
                        : bottomNavigationBarThemeData.unselectedLabelStyle,
                  ).tr(),
                )
              ],
            );
          },
          activeIndex: state.tabIndex,
          splashSpeedInMilliseconds: 0,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          onTap: (index) => _pageViewController.jumpToPage(index),
        ),
        body: SafeArea(
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageViewController,
            itemCount: tabViews.length,
            itemBuilder: (context, index) {
              return tabViews[index];
            },
            onPageChanged: (index) {
              if (index != state.tabIndex) {
                context.read<TabNavigationCubit>().tabChanged(index);
              }
            },
          ),
        ),
      );
    });
  }
}
