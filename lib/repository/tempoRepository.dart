import 'dart:collection';

import 'package:easy_tempo/cubit/search_cubit.dart';
import 'package:easy_tempo/models/jira_issue.dart';
import 'package:dio/dio.dart';
import 'package:easy_tempo/models/jql_result.dart';
import 'package:easy_tempo/models/normal_issue.dart';
import 'package:easy_tempo/models/tempo_log_item.dart';
import 'package:easy_tempo/services/tempoServicesProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:easy_localization/easy_localization.dart';

class TempoRepository {
  final TempoServiceProvider tempoServiceProvider;

  TempoRepository({@required this.tempoServiceProvider})
      : assert(tempoServiceProvider != null);

  Future<List<TempoLogItem>> getRecentLoggedItem(
      {Map<String, String> headers}) async {
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.add(Duration(days: -30));

    return await tempoServiceProvider.getLoggedItemByDate(startDate, endDate,
        headers: headers);
  }

  Future<List<TempoLogItem>> getWorkLogByWeek(DateTime date,
      {Map<String, String> headers}) async {
    DateTime weekBegin = date.add(Duration(days: -date.weekday + 1));
    DateTime weekEnd = date.add(Duration(days: 7 - date.weekday));

    return await tempoServiceProvider.getLoggedItemByDate(weekBegin, weekEnd,
        headers: headers);
  }

  Future<List<TempoLogItem>> getWorkLogByDay(DateTime date,
      {Map<String, String> headers}) async {
    return await tempoServiceProvider.getLoggedItemByDate(date, date,
        headers: headers);
  }

  Future<void> deleteWorklogItem(int logItemId,
      {Map<String, String> headers}) async {
    Response response = await tempoServiceProvider.deleteLoggedItem(logItemId,
        headers: headers);
    if (response != null) {
      toast(tr('Success'));
    }
  }

  Future<TempoLogItem> copyToToday(TempoLogItem item,
      {Map<String, String> headers}) async {
    TempoLogItem tempoLogItem =
        await tempoServiceProvider.copyToToday(item, headers: headers);
    if (tempoLogItem != null) {
      toast(tr('Success'));
    }
    return tempoLogItem;
  }

  Future<List<NormalIssue>> searchJiraTicket(SearchType type, String searchText,
      {int maxResult = 25, Map<String, String> headers}) async {
    List<NormalIssue> result = List<NormalIssue>();
    String jql;
    switch (type) {
      case SearchType.recent:
        List<TempoLogItem> items =
            await tempoServiceProvider.getLoggedItemByDate(
                DateTime.now().add(Duration(days: -30)), DateTime.now());
        String itemNames = '';
        if (items.length > 0) {
          itemNames =
              ' AND issue in (${items.map((item) => "${item.issue.key}").join(",")})';
        }
        print(itemNames);
        jql =
            'project in projectsWhereUserHasPermission("Work on issues")$itemNames';

        items
            .where((item) =>
                item.issue.summary.contains(searchText) ||
                item.issue.key.contains(searchText))
            .map((item) {
          NormalIssue issue = item.toNormalIssue();
          if (result.every((i) => i.key != issue.key)) {
            result.add(issue);
          }
        }).toList();
        break;
      case SearchType.favourites:
        List<String> favorites = await tempoServiceProvider.getFavourites();
        jql =
            'project in projectsWhereUserHasPermission("Work on issues") AND issue in (${favorites.join(',')})';
        break;

      case SearchType.assigned:
        // TODO: Handle this case.
        break;
      case SearchType.mysprint:
        // TODO: Handle this case.
        break;
    }
    // if (searchText.trim().isEmpty) {
    //   JiraIssue jiraIssue = await tempoServiceProvider.getIssues(jql: jql);
    //   result = jiraIssue.convertToNormalIssues();
    // } else {
    //   JqlResult jqlResult =
    //       await tempoServiceProvider.getIssueByJQL(jql, searchText);
    //   result = jqlResult.convertToNormalIssues();
    // }
    return result;
  }
}
