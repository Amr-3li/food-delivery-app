class AddNewAddressModel {
  AddNewAddressModel({
    required this.lat,
    required this.lon,
    required this.name,
    required this.displayName,
    required this.isDefault,
  });

  final double? lat;
  final double? lon;
  final String? name;
  final String? displayName;
  final bool? isDefault;

  factory AddNewAddressModel.fromJson(Map<String, dynamic> json){
    return AddNewAddressModel(
      lat: json["lat"],
      lon: json["lon"],
      name: json["name"],
      displayName: json["display_name"],
      isDefault: json["is_default"],
    );
  }

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "name": name,
    "display_name": displayName,
    "is_default": isDefault,
  };

}

class AddressModel {
  AddressModel({
    required this.city,
    required this.country,
    required this.postcode,
  });

  final String? city;
  final String? country;
  final int? postcode;

  factory AddressModel.fromJson(Map<String, dynamic> json){
    return AddressModel(
      city: json["city"],
      country: json["country"],
      postcode: json["postcode"],
    );
  }

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "postcode": postcode,
  };

}
