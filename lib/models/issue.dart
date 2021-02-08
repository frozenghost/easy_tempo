import 'package:equatable/equatable.dart';

class Issue extends Equatable {
  final String iconUrl;
  final String issueStatus;
  final List<String> versions;
  final List<String> components;
  final int projectId;
  final String projectKey;
  final bool internalIssue;
  final String parentKey;
  final String epicKey;
  final String epicName;
  final String customFields;
  final String summary;
  final String accountKey;
  final String issueType;
  final int estimatedRemainingSeconds;
  final int originalEstimateSeconds;
  final String key;
  final int id;

  Issue(
      {this.iconUrl,
      this.issueStatus,
      this.versions,
      this.components,
      this.projectId,
      this.projectKey,
      this.internalIssue,
      this.parentKey,
      this.epicKey,
      this.epicName,
      this.customFields,
      this.summary,
      this.accountKey,
      this.issueType,
      this.estimatedRemainingSeconds,
      this.originalEstimateSeconds,
      this.key,
      this.id});

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      iconUrl: json['iconUrl'],
      issueStatus: json['issueStatus'],
      // versions: json['versions'] != null
      //     ? json['versions'].map((v) => v.toString()).toList()
      //     : null,
      // components: json['components'] != null
      //     ? json['components'].map((v) => v.toString()).toList()
      //     : null,
      projectId: json['projectId'],
      projectKey: json['projectKey'],
      internalIssue: json['internalIssue'],
      parentKey: json['parentKey'],
      epicKey: json['epicKey'],
      epicName: json['epicName'],
      customFields: json['customFields'],
      summary: json['summary'],
      accountKey: json['accountKey'],
      issueType: json['issueType'],
      estimatedRemainingSeconds: json['estimatedRemainingSeconds'],
      originalEstimateSeconds: json['originalEstimateSeconds'],
      key: json['key'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconUrl'] = this.iconUrl;
    data['issueStatus'] = this.issueStatus;
    if (this.versions != null) {
      data['versions'] = this.versions.map((v) => v.toString()).toList();
    }
    if (this.components != null) {
      data['components'] = this.components.map((v) => v.toString()).toList();
    }
    data['projectId'] = this.projectId;
    data['projectKey'] = this.projectKey;
    data['internalIssue'] = this.internalIssue;
    data['parentKey'] = this.parentKey;
    data['epicKey'] = this.epicKey;
    data['epicName'] = this.epicName;
    data['customFields'] = this.customFields;
    data['summary'] = this.summary;
    data['accountKey'] = this.accountKey;
    data['issueType'] = this.issueType;
    data['estimatedRemainingSeconds'] = this.estimatedRemainingSeconds;
    data['originalEstimateSeconds'] = this.originalEstimateSeconds;
    data['key'] = this.key;
    data['id'] = this.id;
    return data;
  }

  @override
  List<Object> get props => [
        this.iconUrl,
        this.issueStatus,
        this.versions,
        this.components,
        this.projectId,
        this.projectKey,
        this.internalIssue,
        this.parentKey,
        this.epicKey,
        this.epicName,
        this.customFields,
        this.summary,
        this.accountKey,
        this.issueType,
        this.estimatedRemainingSeconds,
        this.originalEstimateSeconds,
        this.key,
        this.id
      ];
}
