import 'package:easy_tempo/models/normal_issue.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import "issues_adv.dart";

part 'jira_issue.g.dart';

@JsonSerializable()
class JiraIssue extends Equatable {
  @JsonKey(name: 'expand')
  final String expand;
  @JsonKey(name: 'startAt')
  final int startAt;
  @JsonKey(name: 'maxResults')
  final int maxResults;
  @JsonKey(name: 'total')
  final int total;
  @JsonKey(name: 'issues')
  final List<IssuesAdv> issues;

  const JiraIssue({
    this.expand,
    this.startAt,
    this.maxResults,
    this.total,
    this.issues,
  });

  @override
  String toString() {
    return 'JiraIssue(expand: $expand, startAt: $startAt, maxResults: $maxResults, total: $total, issues: $issues)';
  }

  factory JiraIssue.fromJson(Map<String, dynamic> json) {
    return _$JiraIssueFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JiraIssueToJson(this);

  JiraIssue copyWith({
    String expand,
    int startAt,
    int maxResults,
    int total,
    List<IssuesAdv> issues,
  }) {
    return JiraIssue(
      expand: expand ?? this.expand,
      startAt: startAt ?? this.startAt,
      maxResults: maxResults ?? this.maxResults,
      total: total ?? this.total,
      issues: issues ?? this.issues,
    );
  }

  List<NormalIssue> convertToNormalIssues() {
    List<NormalIssue> result = List<NormalIssue>();
    if (issues != null && issues.length > 0) {
      result = issues.map((item) {
        return NormalIssue(
          id: int.parse(item.id),
          key: item.key,
          iconPath: item.fields?.issuetype?.iconUrl,
          summary: item.fields?.summary,
        );
      }).toList();
    }
    return result;
  }

  @override
  List<Object> get props => [expand, startAt, maxResults, total, issues];
}
