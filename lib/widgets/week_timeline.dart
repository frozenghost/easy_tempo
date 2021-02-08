import 'package:date_format/date_format.dart';
import 'package:easy_tempo/constants/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:timelines/timelines.dart';

const int daysOfWeek = 7;
const double indicatorSize = 25.0;

class WeekTimeline extends StatelessWidget {
  WeekTimeline({
    Key key,
    @required this.date,
    this.weekOffset = 0,
    @required this.clickOnDate,
    this.textColor = Colors.black,
    this.selectedTextColor = Colors.white,
    this.todayColor = Colors.grey,
    this.selectedColor = Colors.teal,
    this.pastTimeLineNodeColor = Colors.blue,
    this.selectedTimeLineNodeColor = Colors.teal,
    this.futureTimeLineNodeColor = Colors.grey,
    this.normalColor = Colors.transparent,
  }) : super(key: key);
  final DateTime date;
  final int weekOffset;
  final Function(DateTime date) clickOnDate;
  final Color textColor;
  final Color selectedTextColor;
  final Color todayColor;
  final Color selectedColor;
  final Color normalColor;
  final Color pastTimeLineNodeColor;
  final Color selectedTimeLineNodeColor;
  final Color futureTimeLineNodeColor;

  bool isToday(List<DateTime> dateRange, int index) =>
      formatDate(dateRange[index], [yyyy, mm, dd]) ==
      formatDate(DateTime.now(), [yyyy, mm, dd]);
  bool isSelected(List<DateTime> dateRange, int index) =>
      dateRange[index].isAtSameMomentAs(date);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<DateTime> dateRange = List<DateTime>();
    DateTime dateStart =
        date.add(Duration(days: -date.weekday + 1 + weekOffset * daysOfWeek));
    for (var i = 0; i < daysOfWeek; i++) {
      dateRange.add(dateStart.add(Duration(days: i)));
    }

    return Container(
      alignment: Alignment.center,
      height: 100.0,
      width: width,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(
            space: 20.0,
            thickness: 5.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          // connectionDirection: ConnectionDirection.before,
          contentsAlign: ContentsAlign.basic,
          oppositeContentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              formatDate(dateRange[index], [mm, '-', dd]),
              style: GoogleFonts.openSans(fontSize: 15),
            ),
          ),
          contentsBuilder: (context, index) => FlatButton(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              TempoAppConst.weekDays[dateRange[index].weekday],
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: formatDate(dateRange[index], [yyyy, mm, dd]) ==
                              formatDate(date, [yyyy, mm, dd]) &&
                          weekOffset == 0
                      ? selectedTextColor
                      : isToday(dateRange, index)
                          ? selectedTextColor
                          : textColor),
            ).tr(),
            shape: PolygonBorder(
              sides: 6,
            ),
            color: formatDate(dateRange[index], [yyyy, mm, dd]) ==
                        formatDate(date, [yyyy, mm, dd]) &&
                    weekOffset == 0
                ? selectedColor
                : isToday(dateRange, index)
                    ? todayColor
                    : normalColor,
            onPressed: () {
              clickOnDate(dateRange[index]);
            },
          ),
          itemExtent: width / daysOfWeek,
          itemCount: daysOfWeek,
          connectorBuilder: (_, index, type) {
            var gradientColors;
            if (isSelected(dateRange, index + 1) &&
                dateRange[index].isBefore(DateTime.now())) {
              if (type == ConnectorType.start) {
                gradientColors = [
                  Color.lerp(
                      pastTimeLineNodeColor, selectedTimeLineNodeColor, 0.5),
                  selectedTimeLineNodeColor
                ];
              } else {
                gradientColors = [
                  pastTimeLineNodeColor,
                  Color.lerp(
                      pastTimeLineNodeColor, selectedTimeLineNodeColor, 0.5),
                ];
              }
              return DecoratedLineConnector(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                ),
              );
            }
            if (isToday(dateRange, index)) {
              return DashedLineConnector(
                color: futureTimeLineNodeColor,
                dash: 1.7,
              );
            } else if (dateRange[index].isBefore(DateTime.now())) {
              return SolidLineConnector(
                color: pastTimeLineNodeColor,
              );
            } else {
              return DashedLineConnector(
                color: futureTimeLineNodeColor,
                dash: 1.7,
              );
            }
          },
          indicatorBuilder: (_, index) {
            if (isSelected(dateRange, index)) {
              return getIndicator(
                  FontAwesomeIcons.handPointDown, selectedTimeLineNodeColor);
            } else if (dateRange[index].isBefore(DateTime.now())) {
              return getIndicator(
                  FontAwesomeIcons.angleRight, pastTimeLineNodeColor);
            } else {
              return getIndicator(
                  FontAwesomeIcons.hourglass, futureTimeLineNodeColor);
            }
          },
        ),
      ),
    );
  }

  Widget getIndicator(IconData iconData, Color color) {
    return OutlinedDotIndicator(
      color: color,
      size: indicatorSize,
      child: Icon(
        iconData,
        color: color,
        size: 15,
      ),
    );
  }
}
