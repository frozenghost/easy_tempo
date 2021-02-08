// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jira_issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JiraIssue _$JiraIssueFromJson(Map<String, dynamic> json) {
  return JiraIssue(
    expand: json['expand'] as String,
    startAt: json['startAt'] as int,
    maxResults: json['maxResults'] as int,
    total: json['total'] as int,
    issues: (json['issues'] as List)
        ?.map((e) =>
            e == null ? null : IssuesAdv.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JiraIssueToJson(JiraIssue instance) => <String, dynamic>{
      'expand': instance.expand,
      'startAt': instance.startAt,
      'maxResults': instance.maxResults,
      'total': instance.total,
      'issues': instance.issues,
    };
