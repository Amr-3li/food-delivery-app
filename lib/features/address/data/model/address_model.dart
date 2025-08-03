class AddressesModel {
  AddressesModel({
    this.id,
    this.lat,
    this.lon,
    this.name,
    this.displayName,
    this.isDefault,
  });

  final int? id;
  final String? lat;
  final String? lon;
  final String? name;
  final String? displayName;
  final bool? isDefault;

  factory AddressesModel.fromJson(Map<String, dynamic> json) {
    return AddressesModel(
      id: json["id"],
      lat: json["lat"]?.toString(),
      lon: json["lon"]?.toString(),
      name: json["name"]?.toString(),
      displayName: json["display_name"]?.toString(),
      isDefault: json["is_default"] == 1 || json["is_default"] == true,
    );
  }


  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "name": name,
    "display_name": displayName,
    "is_default": isDefault == true ? 1 : 0,
  };

}
