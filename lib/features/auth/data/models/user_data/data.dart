import 'user.dart';

class Data {
	User? user;
	String? accessToken;
	String? tokenType;

	Data({this.user, this.accessToken, this.tokenType});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
				accessToken: json['access_token'] as String?,
				tokenType: json['token_type'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'user': user?.toJson(),
				'access_token': accessToken,
				'token_type': tokenType,
			};
}
