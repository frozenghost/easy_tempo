import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import "issuetype.dart";

part 'fields.g.dart';

@JsonSerializable()
class Fields extends Equatable {
	@JsonKey(name: 'summary')
	final String summary;
	@JsonKey(name: 'issuetype')
	final Issuetype issuetype;

	const Fields({this.summary, this.issuetype});

	@override
	String toString() {
		return 'Fields(summary: $summary, issuetype: $issuetype)';
	}

	factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);

	Map<String, dynamic> toJson() => _$FieldsToJson(this);

	Fields copyWith({
		String summary,
		Issuetype issuetype,
	}) {
		return Fields(
			summary: summary ?? this.summary,
			issuetype: issuetype ?? this.issuetype,
		);
	}

	@override
	List<Object> get props => [summary, issuetype];
}
