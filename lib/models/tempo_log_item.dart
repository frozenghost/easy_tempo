import 'package:easy_tempo/models/normal_issue.dart';
import 'package:equatable/equatable.dart';
import "issue.dart";
import "attributes.dart";

class TempoLogItem extends Equatable {
  final String timeSpent;
  final String comment;
  final int tempoWorklogId;
  final String started;
  final String workerId;
  final int originTaskId;
  final Issue issue;
  final int timeSpentSeconds;
  final int billableSeconds;
  final int jiraWorklogId;
  final String dateCreated;
  final String dateUpdated;
  final String updaterId;
  final int originId;
  final Attributes attributes;

  TempoLogItem(
      {this.timeSpent,
      this.comment,
      this.tempoWorklogId,
      this.started,
      this.workerId,
      this.originTaskId,
      this.issue,
      this.timeSpentSeconds,
      this.billableSeconds,
      this.jiraWorklogId,
      this.dateCreated,
      this.dateUpdated,
      this.updaterId,
      this.originId,
      this.attributes});

  factory TempoLogItem.fromJson(Map<String, dynamic> json) {
    return TempoLogItem(
      timeSpent: json['timeSpent'],
      comment: json['comment'],
      tempoWorklogId: json['tempoWorklogId'],
      started: json['started'],
      workerId: json['workerId'],
      originTaskId: json['originTaskId'],
      issue: json['issue'] != null ? new Issue.fromJson(json['issue']) : null,
      timeSpentSeconds: json['timeSpentSeconds'],
      billableSeconds: json['billableSeconds'],
      jiraWorklogId: json['jiraWorklogId'],
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      updaterId: json['updaterId'],
      originId: json['originId'],
      attributes: json['attributes'] != null
          ? new Attributes.fromJson(json['attributes'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeSpent'] = this.timeSpent;
    data['comment'] = this.comment;
    data['tempoWorklogId'] = this.tempoWorklogId;
    data['started'] = this.started;
    data['workerId'] = this.workerId;
    data['originTaskId'] = this.originTaskId;
    if (this.issue != null) {
      data['issue'] = this.issue.toJson();
    }
    data['timeSpentSeconds'] = this.timeSpentSeconds;
    data['billableSeconds'] = this.billableSeconds;
    data['jiraWorklogId'] = this.jiraWorklogId;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['updaterId'] = this.updaterId;
    data['originId'] = this.originId;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }

  NormalIssue toNormalIssue() {
    return NormalIssue(
      id: this.jiraWorklogId,
      key: this.issue.key,
      summary: this.issue.summary,
      originalTaskId: this.originTaskId,
    );
  }

  @override
  List<Object> get props => [
        this.timeSpent,
        this.comment,
        this.tempoWorklogId,
        this.started,
        this.workerId,
        this.originTaskId,
        this.issue,
        this.timeSpentSeconds,
        this.billableSeconds,
        this.jiraWorklogId,
        this.dateCreated,
        this.dateUpdated,
        this.updaterId,
        this.originId,
        this.attributes
      ];
}
