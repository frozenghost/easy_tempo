import 'package:date_format/date_format.dart';
import 'package:easy_tempo/cubit/tempoweek_cubit.dart';
import 'package:easy_tempo/models/tempo_log_item.dart';
import 'package:easy_tempo/widgets/LoadingSpinner.dart';
import 'package:easy_tempo/widgets/navigation_card.dart';
import 'package:easy_tempo/widgets/tag_button.dart';
import 'package:easy_tempo/widgets/week_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorklogWeekSummaryPage extends StatelessWidget {
  final Map<IconData, String> navigationIcons = {
    FontAwesomeIcons.calendarCheck: 'My Work',
    FontAwesomeIcons.fileContract: 'Timesheet',
    FontAwesomeIcons.running: 'My Sprint',
    FontAwesomeIcons.cogs: 'Settings'
  };

  @override
  Widget build(BuildContext context) {
    double start = -1;
    double end = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    ScrollController _controller = new ScrollController(
        initialScrollOffset:
            screenWidth); //initialize the scroll offset to the screen width

    return Container(
      color: Theme.of(context).backgroundColor,
      alignment: Alignment.topCenter,
      child: BlocBuilder<TempoWeekCubit, TempoWeekState>(
          builder: (context, state) {
        double progress = getDailyLogPregress(state);
        return Column(
          children: [
            Container(
              height: 120.0,
              child: Listener(
                child: ListView(
                  children:
                      getAllTimeLines(state.date, Theme.of(context), (date) {
                    if (formatDate(date, [yyyy, mm, dd]) !=
                        formatDate(state.date, [yyyy, mm, dd])) {
                      context.read<TempoWeekCubit>().changeCurrentDate(date);
                    }
                  }),
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                ),
                onPointerDown: (event) {
                  start = event.position.dx;
                },
                onPointerUp: (event) {
                  if (start > 0) {
                    end = event.position.dx;
                    bool isFromLeftToRight = (end - start) > 0;
                    if ((end - start).abs() >= screenWidth * 0.6) {
                      _controller
                          .animateTo(
                              isFromLeftToRight
                                  ? 0
                                  : _controller.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease)
                          .then((value) {
                        context.read<TempoWeekCubit>().changeCurrentDate(state
                            .date
                            .add(Duration(days: isFromLeftToRight ? -7 : 7)));
                        _controller.jumpTo(screenWidth);
                      });
                    } else {
                      _controller.animateTo(screenWidth,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              height: 35.0,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          // padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            'DailyLoggedHours',
                            style: TextStyle(fontSize: 10.0),
                          ).tr(args: ['${progress * 8}']),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Divider(
                            height: 2.0,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          // padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            'DailyRemainingHours',
                            style: TextStyle(fontSize: 10.0),
                          ).tr(args: ['${8 - progress * 8}']),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: Stack(children: [
                      Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          value: progress,
                        ),
                      ),
                      Center(
                          child: Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: TextStyle(fontSize: 10.0),
                      )),
                    ]),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, right: 8.0),
                          child: TagButton(
                            text: Text(
                              'Today',
                              textAlign: TextAlign.left,
                            ).tr(),
                            icon: FontAwesomeIcons.caretRight,
                            backgroundColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              context
                                  .read<TempoWeekCubit>()
                                  .changeCurrentDate(DateTime.now());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 1,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade300
                          : Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ],
                ),
                child: BlocConsumer<TempoWeekCubit, TempoWeekState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    switch (state.status) {
                      case PageStatus.initial:
                        return Text('init');
                      case PageStatus.loading:
                        return LoadingSpinner();
                      case PageStatus.success:
                        return state.items.length > 0
                            ? RefreshIndicator(
                                child: ListView(
                                  padding: const EdgeInsets.all(10.0),
                                  children: getLogItemNavigationCards(
                                      context, state.items),
                                ),
                                onRefresh: () {
                                  return context
                                      .read<TempoWeekCubit>()
                                      .refreshWorklog();
                                },
                              )
                            : RefreshIndicator(
                                child: Center(
                                  child: PageView(
                                    scrollDirection: Axis.vertical,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    children: [Center(child: Text('no item'))],
                                  ),
                                ),
                                onRefresh: () {
                                  return context
                                      .read<TempoWeekCubit>()
                                      .refreshWorklog();
                                },
                              );
                      case PageStatus.failure:
                      default:
                        return Text('error');
                    }
                  },
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  List<Widget> getAllTimeLines(
      DateTime date, ThemeData themeData, Function(DateTime) clickOnDate) {
    List<Widget> contents = List<Widget>();

    contents.add(WeekTimeline(
      date: date,
      weekOffset: -1,
      clickOnDate: clickOnDate,
      selectedColor: themeData.primaryColor,
      selectedTimeLineNodeColor: themeData.primaryColor,
      textColor: themeData.textTheme.bodyText1.color,
      pastTimeLineNodeColor: themeData.accentColor,
      futureTimeLineNodeColor: themeData.disabledColor,
    ));
    contents.add(WeekTimeline(
      date: date,
      clickOnDate: clickOnDate,
      selectedColor: themeData.primaryColor,
      selectedTimeLineNodeColor: themeData.primaryColor,
      textColor: themeData.textTheme.bodyText1.color,
      pastTimeLineNodeColor: themeData.accentColor,
      futureTimeLineNodeColor: themeData.disabledColor,
    ));
    contents.add(WeekTimeline(
      date: date,
      weekOffset: 1,
      clickOnDate: clickOnDate,
      selectedColor: themeData.primaryColor,
      selectedTimeLineNodeColor: themeData.primaryColor,
      textColor: themeData.textTheme.bodyText1.color,
      pastTimeLineNodeColor: themeData.accentColor,
      futureTimeLineNodeColor: themeData.disabledColor,
    ));

    return contents;
  }

  List<Widget> getLogItemNavigationCards(
      BuildContext context, List<TempoLogItem> items) {
    return items.map((item) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: NavigationCard(
          title: item.issue.summary,
          description: item.comment,
          issueKey: item.issue.epicKey == null
              ? item.issue.projectKey
              : item.issue.epicKey,
          secondsSpend: item.timeSpentSeconds,
        ),
        actions: [
          IconSlideAction(
            caption: tr('CopyToToday'),
            color: Colors.blue,
            iconWidget: Center(
              child: Icon(
                FontAwesomeIcons.clone,
                color: Colors.white,
              ),
            ),
            onTap: () async {
              await context.read<TempoWeekCubit>().copyWorklogToToday(item);
            },
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            caption: tr('Move'),
            color: Colors.teal,
            iconWidget: Center(
              child: Icon(
                FontAwesomeIcons.fileImport,
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
          IconSlideAction(
            caption: tr('Delete'),
            color: Colors.red,
            iconWidget: Center(
              child: Icon(
                FontAwesomeIcons.trash,
                color: Colors.white,
              ),
            ),
            onTap: () async {
              await context
                  .read<TempoWeekCubit>()
                  .deleteWorklog(item.tempoWorklogId);
            },
          ),
        ],
      );
    }).toList();
  }

  double getDailyLogPregress(TempoWeekState state) {
    if (state.items?.length == 0) {
      return 0;
    }

    return state.items
            .map((e) => e.timeSpentSeconds)
            .toList()
            .reduce((prev, curr) => (prev + curr)) /
        8 /
        60 /
        60;
  }
}
