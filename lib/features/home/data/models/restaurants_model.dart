class RestaurantsModel {
  RestaurantsModel({
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  final bool? success;
  final String? message;
  final List<Datum> data;
  final Meta? meta;

  factory RestaurantsModel.fromJson(Map<String, dynamic> json){
    return RestaurantsModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.profileImage,
    required this.bio,
    required this.phone,
    required this.status,
    required this.rating,
    required this.stats,
    required this.joinedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? location;
  final String? profileImage;
  final String? bio;
  final String? phone;
  final Status? status;
  final Rating? rating;
  final Stats? stats;
  final String? joinedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      location: json["location"],
      profileImage: json["profile_image"],
      bio: json["bio"],
      phone: json["phone"],
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      joinedAt: json["joined_at"],
    );
  }

}

class Rating {
  Rating({
    required this.average,
    required this.totalReviews,
  });

  final int? average;
  final int? totalReviews;

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
      average: json["average"],
      totalReviews: json["total_reviews"],
    );
  }

}

class Stats {
  Stats({
    required this.totalDishes,
    required this.activeDishes,
  });

  final int? totalDishes;
  final int? activeDishes;

  factory Stats.fromJson(Map<String, dynamic> json){
    return Stats(
      totalDishes: json["total_dishes"],
      activeDishes: json["active_dishes"],
    );
  }

}

class Status {
  Status({
    required this.isVerified,
    required this.isOpen,
  });

  final bool? isVerified;
  final bool? isOpen;

  factory Status.fromJson(Map<String, dynamic> json){
    return Status(
      isVerified: json["is_verified"],
      isOpen: json["is_open"],
    );
  }

}

class Meta {
  Meta({
    required this.total,
    required this.showing,
  });

  final int? total;
  final int? showing;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      total: json["total"],
      showing: json["showing"],
    );
  }

}
