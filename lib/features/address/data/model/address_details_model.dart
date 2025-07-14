class AddressDetailsModel {
  AddressDetailsModel({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.addressDetailsModelClass,
    this.type,
    this.placeRank,
    this.importance,
    this.addresstype,
    this.name,
    this.displayName,
    this.address,
    this.boundingbox,
  });

  final int? placeId;
  final String? licence;
  final String? osmType;
  final int? osmId;
  final String? lat;
  final String? lon;
  final String? addressDetailsModelClass;
  final String? type;
  final int? placeRank;
  final double? importance;
  final String? addresstype;
  final String? name;
  final String? displayName;
  final Address? address;
  final List<String>? boundingbox;

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json){
    return AddressDetailsModel(
      placeId: json["place_id"],
      licence: json["licence"],
      osmType: json["osm_type"],
      osmId: json["osm_id"],
      lat: json["lat"],
      lon: json["lon"],
      addressDetailsModelClass: json["class"],
      type: json["type"],
      placeRank: json["place_rank"],
      importance: json["importance"],
      addresstype: json["addresstype"],
      name: json["name"],
      displayName: json["display_name"],
      address: json["address"] == null ? null : Address.fromJson(json["address"]),
      boundingbox: json["boundingbox"] == null ? [] : List<String>.from(json["boundingbox"]!.map((x) => x)),
    );
  }

}

class Address {
  Address({
    required this.houseNumber,
    required this.road,
    required this.neighbourhood,
    required this.city,
    required this.state,
    required this.iso31662Lvl4,
    required this.postcode,
    required this.country,
    required this.countryCode,
  });

  final String? houseNumber;
  final String? road;
  final String? neighbourhood;
  final String? city;
  final String? state;
  final String? iso31662Lvl4;
  final String? postcode;
  final String? country;
  final String? countryCode;

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      houseNumber: json["house_number"],
      road: json["road"],
      neighbourhood: json["neighbourhood"],
      city: json["city"],
      state: json["state"],
      iso31662Lvl4: json["ISO3166-2-lvl4"],
      postcode: json["postcode"],
      country: json["country"],
      countryCode: json["country_code"],
    );
  }

}
