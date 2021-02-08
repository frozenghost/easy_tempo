import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_tempo/cubit/search_cubit.dart';
import 'package:easy_tempo/cubit/tempoweek_cubit.dart';
import 'package:easy_tempo/widgets/LoadingSpinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketSearchPage extends StatefulWidget {
  @override
  _TicketSearchPageState createState() => _TicketSearchPageState();
}

class _TicketSearchPageState extends State<TicketSearchPage> {
  String searchText;

  @override
  void initState() {
    context.read<SearchCubit>().search();
    super.initState();
  }

  final Map<IconData, String> navigationIcons = {
    FontAwesomeIcons.calendarCheck: 'Recent',
    FontAwesomeIcons.userPlus: 'AssignToMe',
    FontAwesomeIcons.running: 'MySprint',
    FontAwesomeIcons.star: 'Favorites'
  };

  @override
  Widget build(BuildContext context) {
    Timer timer;
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      BottomNavigationBarThemeData bottomNavigationBarThemeData =
          Theme.of(context).bottomNavigationBarTheme;
      return Scaffold(
        appBar: AppBar(
          title: Text('JiraIssues').tr(),
        ),
        body: SafeArea(
          child: Container(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Container(
                  height: 45.0,
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 10.0,
                  ),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Theme.of(context).primaryColor,
                      accentColor: Theme.of(context).primaryColor,
                      hintColor: Colors.black45,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7.0),
                        hintText: 'Input your search text',
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        timer?.cancel();
                        timer = Timer(Duration(seconds: 1), () {
                          print(value);
                          context.read<SearchCubit>().setSearchText(value);
                          context.read<SearchCubit>().search();
                        });
                      },
                    ),
                  ),
                ),
                generateControl(context, state),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        //   backgroundColor: bottomNavigationBarThemeData.backgroundColor,
        //   itemCount: navigationIcons.length,
        //   tabBuilder: (int index, bool isActive) {
        //     return Column(
        //       mainAxisSize: MainAxisSize.min,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(navigationIcons.keys.elementAt(index),
        //             size: 24,
        //             color: isActive
        //                 ? bottomNavigationBarThemeData.selectedIconTheme?.color
        //                 : bottomNavigationBarThemeData
        //                     .unselectedIconTheme?.color),
        //         SizedBox(height: 4),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 8),
        //           child: Text(
        //             navigationIcons.values.elementAt(index),
        //             maxLines: 1,
        //             style: isActive
        //                 ? bottomNavigationBarThemeData.selectedLabelStyle
        //                 : bottomNavigationBarThemeData.unselectedLabelStyle,
        //           ).tr(),
        //         )
        //       ],
        //     );
        //   },
        //   activeIndex: state.type.index,
        //   splashSpeedInMilliseconds: 0,
        //   gapLocation: GapLocation.center,
        //   onTap: (index) {
        //     context.read<SearchCubit>().switchType(SearchType.values[index]);
        //   },
        // ),
      );
    });
  }

  Widget generateControl(BuildContext context, SearchState state) {
    switch (state.status) {
      case PageStatus.initial:
        return Text('init');
      case PageStatus.loading:
        return Expanded(child: LoadingSpinner());
      case PageStatus.success:
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 5.0,
            ),
            child: ListView.builder(
                itemCount: state.issues.length,
                itemBuilder: (context, index) {
                  final Decoration decoration = BoxDecoration(
                    border: Border(
                      bottom: Divider.createBorderSide(context),
                    ),
                  );
                  return DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: decoration,
                    child: ListTile(
                      dense: true,
                      tileColor: Theme.of(context).scaffoldBackgroundColor,
                      title: Text(
                        state.issues[index].key,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        state.issues[index].summary,
                        maxLines: 1,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      leading: Icon(
                        FontAwesomeIcons.ticketAlt,
                        color: Colors.blue.shade400,
                      ),
                    ),
                  );
                }),
          ),
        );
        break;
      default:
        return Text('error');
    }
  }
}
