class SuggestedRestaurantsModel {
  SuggestedRestaurantsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<DatumModel> data;

  factory SuggestedRestaurantsModel.fromJson(Map<String, dynamic> json){
    return SuggestedRestaurantsModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? [] : List<DatumModel>.from(json["data"]!.map((x) => DatumModel.fromJson(x))),
    );
  }

}

class DatumModel {
  DatumModel({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.bio,
    required this.dishesCount,
    required this.avgRating,
  });

  final int? id;
  final String? name;
  final String? profileImage;
  final String? bio;
  final int? dishesCount;
  final int? avgRating;

  factory DatumModel.fromJson(Map<String, dynamic> json){
    return DatumModel(
      id: json["id"],
      name: json["name"],
      profileImage: json["profile_image"],
      bio: json["bio"],
      dishesCount: json["dishes_count"],
      avgRating: json["avg_rating"],
    );
  }

}
