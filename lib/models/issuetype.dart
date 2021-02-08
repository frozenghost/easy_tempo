import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issuetype.g.dart';

@JsonSerializable()
class Issuetype extends Equatable {
	@JsonKey(name: 'self')
	final String self;
	@JsonKey(name: 'id')
	final String id;
	@JsonKey(name: 'description')
	final String description;
	@JsonKey(name: 'iconUrl')
	final String iconUrl;
	@JsonKey(name: 'name')
	final String name;
	@JsonKey(name: 'subtask')
	final bool subtask;
	@JsonKey(name: 'avatarId')
	final int avatarId;

	const Issuetype({
		this.self,
		this.id,
		this.description,
		this.iconUrl,
		this.name,
		this.subtask,
		this.avatarId,
	});

	@override
	String toString() {
		return 'Issuetype(self: $self, id: $id, description: $description, iconUrl: $iconUrl, name: $name, subtask: $subtask, avatarId: $avatarId)';
	}

	factory Issuetype.fromJson(Map<String, dynamic> json) {
		return _$IssuetypeFromJson(json);
	}

	Map<String, dynamic> toJson() => _$IssuetypeToJson(this);

	Issuetype copyWith({
		String self,
		String id,
		String description,
		String iconUrl,
		String name,
		bool subtask,
		int avatarId,
	}) {
		return Issuetype(
			self: self ?? this.self,
			id: id ?? this.id,
			description: description ?? this.description,
			iconUrl: iconUrl ?? this.iconUrl,
			name: name ?? this.name,
			subtask: subtask ?? this.subtask,
			avatarId: avatarId ?? this.avatarId,
		);
	}

	@override
	List<Object> get props {
		return [
			self,
			id,
			description,
			iconUrl,
			name,
			subtask,
			avatarId,
		];
	}
}
