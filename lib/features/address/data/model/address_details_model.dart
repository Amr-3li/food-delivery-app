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

  final String? placeId;
  final String? licence;
  final String? osmType;
  final String? osmId;
  final String? lat;
  final String? lon;
  final String? addressDetailsModelClass;
  final String? type;
  final String? placeRank;
  final String? importance;
  final String? addresstype;
  final String? name;
  final String? displayName;
  final Address? address;
  final List<String>? boundingbox;

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    return AddressDetailsModel(
      placeId: json["place_id"]?.toString(),
      licence: json["licence"]?.toString(),
      osmType: json["osm_type"]?.toString(),
      osmId: json["osm_id"]?.toString(),
      lat: json["lat"]?.toString(),
      lon: json["lon"]?.toString(),
      addressDetailsModelClass: json["class"]?.toString(),
      type: json["type"]?.toString(),
      placeRank: json["place_rank"]?.toString(),
      importance: json["importance"]?.toString(),
      addresstype: json["addresstype"]?.toString(),
      name: json["name"]?.toString(),
      displayName: json["display_name"]?.toString(),
      address: json["address"] == null ? null : Address.fromJson(json["address"]),
      boundingbox: json["boundingbox"] == null
          ? []
          : List<String>.from(json["boundingbox"].map((x) => x.toString())),
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

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      houseNumber: json["house_number"]?.toString(),
      road: json["road"]?.toString(),
      neighbourhood: json["neighbourhood"]?.toString(),
      city: json["city"]?.toString(),
      state: json["state"]?.toString(),
      iso31662Lvl4: json["ISO3166-2-lvl4"]?.toString(),
      postcode: json["postcode"]?.toString(),
      country: json["country"]?.toString(),
      countryCode: json["country_code"]?.toString(),
    );
  }
}
