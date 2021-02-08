import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import "issues.dart";

part 'sections.g.dart';

@JsonSerializable()
class Sections extends Equatable {
	@JsonKey(name: 'label')
	final String label;
	@JsonKey(name: 'sub')
	final String sub;
	@JsonKey(name: 'id')
	final String id;
	@JsonKey(name: 'issues')
	final List<Issues> issues;

	const Sections({
		this.label,
		this.sub,
		this.id,
		this.issues,
	});

	@override
	String toString() {
		return 'Sections(label: $label, sub: $sub, id: $id, issues: $issues)';
	}

	factory Sections.fromJson(Map<String, dynamic> json) {
		return _$SectionsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SectionsToJson(this);

	Sections copyWith({
		String label,
		String sub,
		String id,
		List<Issues> issues,
	}) {
		return Sections(
			label: label ?? this.label,
			sub: sub ?? this.sub,
			id: id ?? this.id,
			issues: issues ?? this.issues,
		);
	}

	@override
	List<Object> get props => [label, sub, id, issues];
}
