import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issues.g.dart';

@JsonSerializable()
class Issues extends Equatable {
	@JsonKey(name: 'id')
	final int id;
	@JsonKey(name: 'key')
	final String key;
	@JsonKey(name: 'keyHtml')
	final String keyHtml;
	@JsonKey(name: 'img')
	final String img;
	@JsonKey(name: 'summary')
	final String summary;
	@JsonKey(name: 'summaryText')
	final String summaryText;

	const Issues({
		this.id,
		this.key,
		this.keyHtml,
		this.img,
		this.summary,
		this.summaryText,
	});

	@override
	String toString() {
		return 'Issues(id: $id, key: $key, keyHtml: $keyHtml, img: $img, summary: $summary, summaryText: $summaryText)';
	}

	factory Issues.fromJson(Map<String, dynamic> json) => _$IssuesFromJson(json);

	Map<String, dynamic> toJson() => _$IssuesToJson(this);

	Issues copyWith({
		int id,
		String key,
		String keyHtml,
		String img,
		String summary,
		String summaryText,
	}) {
		return Issues(
			id: id ?? this.id,
			key: key ?? this.key,
			keyHtml: keyHtml ?? this.keyHtml,
			img: img ?? this.img,
			summary: summary ?? this.summary,
			summaryText: summaryText ?? this.summaryText,
		);
	}

	@override
	List<Object> get props => [id, key, keyHtml, img, summary, summaryText];
}
