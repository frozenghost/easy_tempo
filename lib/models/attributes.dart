import 'package:equatable/equatable.dart';
import "hs_account.dart";

class Attributes extends Equatable  {
	final HsAccount hsAccount;

	Attributes({this.hsAccount});

	factory Attributes.fromJson(Map<String, dynamic> json) {
		return Attributes(
			hsAccount: json['_HS-Account_'] != null ? new HsAccount.fromJson(json['_HS-Account_']) : null,
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.hsAccount != null) {
      data['_HS-Account_'] = this.hsAccount.toJson();
    }
		return data;
	}

	@override
	List<Object> get props => [
		this.hsAccount
	];
}
