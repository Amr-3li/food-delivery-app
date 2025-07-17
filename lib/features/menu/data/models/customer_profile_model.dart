class CustomerProfileModel {
  CustomerProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final DataModel? data;

  factory CustomerProfileModel.fromJson(Map<String, dynamic> json){
    return CustomerProfileModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };

}

class DataModel {
  DataModel({
    required this.user,
    required this.cart,
    required this.favorites,
    required this.addresses,
    required this.paymentMethods,
  });

  final UserModel? user;
  final dynamic cart;
  final List<dynamic> favorites;
  final List<AddressModel> addresses;
  final String? paymentMethods;

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(
      user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      cart: json["cart"],
      favorites: json["favorites"] == null ? [] : List<dynamic>.from(json["favorites"]!.map((x) => x)),
      addresses: json["addresses"] == null ? [] : List<AddressModel>.from(json["addresses"]!.map((x) => AddressModel.fromJson(x))),
      paymentMethods: json["payment_methods"],
    );
  }

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "cart": cart,
    "favorites": favorites.map((x) => x).toList(),
    "addresses": addresses.map((x) => x?.toJson()).toList(),
    "payment_methods": paymentMethods,
  };

}

class AddressModel {
  AddressModel({
    required this.id,
    required this.customerId,
    required this.lat,
    required this.lon,
    required this.addressClass,
    required this.type,
    required this.placeRank,
    required this.name,
    required this.importance,
    required this.displayName,
    required this.address,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? customerId;
  final String? lat;
  final String? lon;
  final String? addressClass;
  final String? type;
  final String? placeRank;
  final String? name;
  final String? importance;
  final String? displayName;
  final String? address;
  final bool? isDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory AddressModel.fromJson(Map<String, dynamic> json){
    return AddressModel(
      id: json["id"],
      customerId: json["customer_id"],
      lat: json["lat"],
      lon: json["lon"],
      addressClass: json["class"],
      type: json["type"],
      placeRank: json["place_rank"],
      name: json["name"],
      importance: json["importance"],
      displayName: json["display_name"],
      address: json["address"],
      isDefault: json["is_default"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "lat": lat,
    "lon": lon,
    "class": addressClass,
    "type": type,
    "place_rank": placeRank,
    "name": name,
    "importance": importance,
    "display_name": displayName,
    "address": address,
    "is_default": isDefault,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };

}

class UserModel {
  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.bio,
    this.type,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic profileImage;
  final dynamic bio;
  final String? type;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      profileImage: json["profile_image"],
      bio: json["bio"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "profile_image": profileImage,
    "bio": bio,
    "type": type,
  };

}
