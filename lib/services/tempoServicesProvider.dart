import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:easy_tempo/constants/const.dart';
import 'package:easy_tempo/models/jira_issue.dart';
import 'package:easy_tempo/models/jql_result.dart';
import 'package:easy_tempo/models/tempo_log_item.dart';
import 'package:easy_tempo/services/baseServiceProvider.dart';
import 'package:flutter/cupertino.dart';

class TempoServiceProvider extends BaseServiceProvider {
  TempoServiceProvider({
    @required Dio dio,
    Function errorCallBack,
    Function successCallBack,
  }) : super(
          dio: dio,
          errorCallBack: errorCallBack,
        );

  // final String jiraUrl = '';
  static Map<String, String> defaultTempoHeaders = {
    'Authorization': 'Bearer $_tempoToken',
    'Content-Type': 'application/json',
  };

  static String _accountId;
  static String _tempoToken = '';

  static const workLogApi =
      'https://app.tempo.io/rest/tempo-timesheets/4/worklogs';

  static const tempoCore = 'https://app.tempo.io/rest/tempo-core';

  static void setUserInfo({String accountId, String tempoToken}) {
    _accountId = accountId ?? _accountId;
    _tempoToken = tempoToken ?? _tempoToken;
    defaultTempoHeaders['Authorization'] = 'Bearer $_tempoToken';
  }

  static String getCurrentAccountId() => _accountId;

  Future<Response> logTime() {}

  // Future<JqlResult> getIssueByJQL(String jql, String jqlQuery,
  //     {Map<String, String> headers}) async {
  //   if (headers != null) {
  //     defaultJiraHeaders.addAll(headers);
  //   }
  //   String query =
  //       'currentJQL=${Uri.encodeComponent(jql)}&query=$jqlQuery&showSubTaskParent=true&showSubTasks=true';
  //   Response response = await super
  //       .get('$jiraUrl/rest/api/3/issue/picker?$query', defaultJiraHeaders);
  //   JqlResult result = JqlResult.fromJson(Map.from(response.data));

  //   return result;
  // }

  Future<List<TempoLogItem>> getLoggedItemByDate(
      DateTime startDate, DateTime endDate,
      {Map<String, String> headers}) async {
    Map postData = {
      'from': formatDate(startDate, [yyyy, '-', mm, '-', dd]),
      'to': formatDate(endDate, [yyyy, '-', mm, '-', dd]),
      'workerId': [_accountId],
    };
    if (headers != null) {
      defaultTempoHeaders.addAll(headers);
    }
    Response response =
        await super.post('$workLogApi/search', defaultTempoHeaders, postData);
    List<TempoLogItem> result = response?.data
        ?.map<TempoLogItem>((m) => TempoLogItem.fromJson(m))
        ?.toList(); //remember to add the type after map<> to avoid the error
    return result;
  }

  Future<Response> deleteLoggedItem(int logItemId,
      {Map<String, String> headers}) async {
    if (headers != null) {
      defaultTempoHeaders.addAll(headers);
    }
    Response response =
        await super.delete('$workLogApi/$logItemId', defaultTempoHeaders, null);
    print(response?.statusCode);
    return response;
  }

  Future<TempoLogItem> copyToToday(TempoLogItem item,
      {Map<String, String> headers}) async {
    if (headers != null) {
      defaultTempoHeaders.addAll(headers);
    }
    Map<String, dynamic> postData = item.toJson();
    DateTime now = DateTime.now();
    postData['started'] =
        DateTime(now.year, now.month, now.day, now.hour).toIso8601String();
    Response response =
        await super.post('$workLogApi/', defaultTempoHeaders, postData);
    TempoLogItem result = response.data
        ?.map<TempoLogItem>((m) => TempoLogItem.fromJson(m))
        ?.toList()
        ?.first;

    return result;
  }

  Future<void> submitItem(TempoLogItem item,
      {Map<String, String> headers}) async {
    if (headers != null) {
      defaultTempoHeaders.addAll(headers);
    }
    Map<String, dynamic> postData = item.toJson();
    await super.post('$workLogApi/', defaultTempoHeaders, postData);
  }

  // Future<JiraIssue> getIssues(
  //     {int maxResults = 25, Map<String, String> headers, String jql}) async {
  //   Map postData = {
  //     'fields': ['issuetype', 'summary'],
  //     'jql': jql,
  //     'maxResults': maxResults,
  //   };
  //   if (headers != null) {
  //     defaultJiraHeaders.addAll(headers);
  //   }
  //   Response response = await super
  //       .post('$jiraUrl/rest/api/3/search/', defaultJiraHeaders, postData);
  //   JiraIssue result = JiraIssue.fromJson(Map.from(response.data));

  //   return result;
  // }

  Future<List<String>> getFavourites({Map<String, String> headers}) async {
    if (headers != null) {
      defaultTempoHeaders.addAll(headers);
    }
    Response response =
        await super.get('$tempoCore/1/favorites/issue/', defaultTempoHeaders);
    return List.from(response.data);
  }
}

//sprint in openSprints() and assignee=currentUser() order by created DESC --get latest open sprint issues
