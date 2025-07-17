import 'data.dart';

class UserData {
	bool? status;
	String? message;
	Data? data;

	UserData({this.status, this.message, this.data});

	factory UserData.fromJson(Map<String, dynamic> json) => UserData(
				status: json['status'] as bool?,
				message: json['message'] as String?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.toJson(),
			};
}
