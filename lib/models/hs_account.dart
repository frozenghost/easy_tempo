import 'package:equatable/equatable.dart';

class HsAccount extends Equatable  {
	final int workAttributeId;
	final String value;
	final String type;
	final String key;
	final String name;

	HsAccount({this.workAttributeId, this.value, this.type, this.key, this.name});

	factory HsAccount.fromJson(Map<String, dynamic> json) {
		return HsAccount(
			workAttributeId: json['workAttributeId'],
			value: json['value'],
			type: json['type'],
			key: json['key'],
			name: json['name'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['workAttributeId'] = this.workAttributeId;
		data['value'] = this.value;
		data['type'] = this.type;
		data['key'] = this.key;
		data['name'] = this.name;
		return data;
	}

	@override
	List<Object> get props => [
		this.workAttributeId,
		this.value,
		this.type,
		this.key,
		this.name
	];
}
