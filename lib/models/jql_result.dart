import 'package:easy_tempo/models/normal_issue.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import "sections.dart";

part 'jql_result.g.dart';

@JsonSerializable()
class JqlResult extends Equatable {
  @JsonKey(name: 'sections')
  final List<Sections> sections;

  const JqlResult({this.sections});

  @override
  String toString() => 'JqlResult(sections: $sections)';

  factory JqlResult.fromJson(Map<String, dynamic> json) {
    return _$JqlResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JqlResultToJson(this);

  JqlResult copyWith({
    List<Sections> sections,
  }) {
    return JqlResult(
      sections: sections ?? this.sections,
    );
  }

  List<NormalIssue> convertToNormalIssues() {
    List<NormalIssue> result = List<NormalIssue>();
    if (sections != null && sections.length > 0) {
      if (sections[1].issues != null && sections[1].issues.length > 0) {
        result = sections[1].issues.map((item) {
          return NormalIssue(
            id: item.id,
            key: item.key,
            iconPath: 'https:///${item.img}',
            summary: item.summary,
          );
        }).toList();
      }
    }
    return result;
  }

  @override
  List<Object> get props => [sections];
}
