class User {
	int? id;
	String? name;
	String? email;
	String? phone;
	dynamic rememberToken;
	dynamic profileImage;
	dynamic bio;
	dynamic emailVerifiedAt;
	String? type;
	DateTime? createdAt;
	DateTime? updatedAt;
	dynamic stripeId;
	dynamic pmType;
	dynamic pmLastFour;
	dynamic trialEndsAt;
	dynamic address;
	dynamic latitude;
	dynamic longitude;

	User({
		this.id, 
		this.name, 
		this.email, 
		this.phone, 
		this.rememberToken, 
		this.profileImage, 
		this.bio, 
		this.emailVerifiedAt, 
		this.type, 
		this.createdAt, 
		this.updatedAt, 
		this.stripeId, 
		this.pmType, 
		this.pmLastFour, 
		this.trialEndsAt, 
		this.address, 
		this.latitude, 
		this.longitude, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				rememberToken: json['remember_token'] as dynamic,
				profileImage: json['profile_image'] as dynamic,
				bio: json['bio'] as dynamic,
				emailVerifiedAt: json['email_verified_at'] as dynamic,
				type: json['type'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				stripeId: json['stripe_id'] as dynamic,
				pmType: json['pm_type'] as dynamic,
				pmLastFour: json['pm_last_four'] as dynamic,
				trialEndsAt: json['trial_ends_at'] as dynamic,
				address: json['address'] as dynamic,
				latitude: json['latitude'] as dynamic,
				longitude: json['longitude'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'phone': phone,
				'remember_token': rememberToken,
				'profile_image': profileImage,
				'bio': bio,
				'email_verified_at': emailVerifiedAt,
				'type': type,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'stripe_id': stripeId,
				'pm_type': pmType,
				'pm_last_four': pmLastFour,
				'trial_ends_at': trialEndsAt,
				'address': address,
				'latitude': latitude,
				'longitude': longitude,
			};
}
