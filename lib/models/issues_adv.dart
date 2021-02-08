import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import "fields.dart";

part 'issues_adv.g.dart';

@JsonSerializable()
class IssuesAdv extends Equatable {
  @JsonKey(name: 'expand')
  final String expand;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'self')
  final String self;
  @JsonKey(name: 'key')
  final String key;
  @JsonKey(name: 'fields')
  final Fields fields;

  const IssuesAdv({
    this.expand,
    this.id,
    this.self,
    this.key,
    this.fields,
  });

  @override
  String toString() {
    return 'Issues(expand: $expand, id: $id, self: $self, key: $key, fields: $fields)';
  }

  factory IssuesAdv.fromJson(Map<String, dynamic> json) =>
      _$IssuesAdvFromJson(json);

  Map<String, dynamic> toJson() => _$IssuesAdvToJson(this);

  IssuesAdv copyWith({
    String expand,
    String id,
    String self,
    String key,
    Fields fields,
  }) {
    return IssuesAdv(
      expand: expand ?? this.expand,
      id: id ?? this.id,
      self: self ?? this.self,
      key: key ?? this.key,
      fields: fields ?? this.fields,
    );
  }

  @override
  List<Object> get props => [expand, id, self, key, fields];
}
