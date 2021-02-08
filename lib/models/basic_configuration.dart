import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_configuration.g.dart';

@JsonSerializable()
class BasicConfiguration extends Equatable {
	@JsonKey(name: 'jiraToken')
	final String jiraToken;
	@JsonKey(name: 'tempoToken')
	final String tempoToken;
	@JsonKey(name: 'account_id')
	final String accountId;
	@JsonKey(name: 'email')
	final String email;
	@JsonKey(name: 'source')
	final String source;

	const BasicConfiguration({
		this.jiraToken,
		this.tempoToken,
		this.accountId,
		this.email,
		this.source,
	});

	@override
	String toString() {
		return 'BasicConfiguration(jiraToken: $jiraToken, tempoToken: $tempoToken, accountId: $accountId, email: $email, source: $source)';
	}

	factory BasicConfiguration.fromJson(Map<String, dynamic> json) {
		return _$BasicConfigurationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$BasicConfigurationToJson(this);

	BasicConfiguration copyWith({
		String jiraToken,
		String tempoToken,
		String accountId,
		String email,
		String source,
	}) {
		return BasicConfiguration(
			jiraToken: jiraToken ?? this.jiraToken,
			tempoToken: tempoToken ?? this.tempoToken,
			accountId: accountId ?? this.accountId,
			email: email ?? this.email,
			source: source ?? this.source,
		);
	}

	@override
	List<Object> get props {
		return [
			jiraToken,
			tempoToken,
			accountId,
			email,
			source,
		];
	}
}
