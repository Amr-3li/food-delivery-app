class MealsTypeDetialsModel {
  MealsTypeDetialsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;

  factory MealsTypeDetialsModel.fromJson(Map<String, dynamic> json){
    return MealsTypeDetialsModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isAvailable,
    required this.rating,
    required this.sizes,
    required this.category,
    required this.createdAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final bool? isAvailable;
  final Rating? rating;
  final List<Size> sizes;
  final Category? category;
  final String? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      imageUrl: json["image_url"],
      isAvailable: json["is_available"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      sizes: json["sizes"] == null ? [] : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      createdAt: json["created_at"],
    );
  }

}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.mealType,
    required this.description,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? mealType;
  final dynamic description;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      mealType: json["meal_type"],
      description: json["description"],
    );
  }

}

class Rating {
  Rating({
    required this.average,
    required this.totalReviews,
  });

  final dynamic average;
  final dynamic totalReviews;

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
      average: json["average"],
      totalReviews: json["total_reviews"],
    );
  }

}

class Size {
  Size({
    required this.id,
    required this.size,
    required this.price,
    required this.currency,
  });

  final int? id;
  final String? size;
  final dynamic price;
  final String? currency;

  factory Size.fromJson(Map<String, dynamic> json){
    return Size(
      id: json["id"],
      size: json["size"],
      price: json["price"],
      currency: json["currency"],
    );
  }

}
