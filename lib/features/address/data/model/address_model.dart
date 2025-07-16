class AddNewAddressModel {
  AddNewAddressModel({
    required this.lat,
    required this.lon,
    required this.name,
    required this.displayName,
    required this.address,
    required this.isDefault,
  });

  final dynamic lat;
  final dynamic lon;
  final dynamic name;
  final dynamic displayName;
  final dynamic address;
  final bool? isDefault;

  factory AddNewAddressModel.fromJson(Map<String, dynamic> json){
    return AddNewAddressModel(
      lat: json["lat"],
      lon: json["lon"],
      name: json["name"],
      displayName: json["display_name"],
      address: json["address"],
      isDefault: json["is_default"],
    );
  }

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "name": name,
    "display_name": displayName,
    "address" : address,
    "is_default": isDefault,
  };

}
