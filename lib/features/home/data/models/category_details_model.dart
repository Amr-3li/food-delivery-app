class CategoryDetailsModel {
  CategoryDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json){
    return CategoryDetailsModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.category,
    required this.dishes,
  });

  final Category? category;
  final List<Dish> dishes;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      dishes: json["dishes"] == null ? [] : List<Dish>.from(json["dishes"]!.map((x) => Dish.fromJson(x))),
    );
  }

}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.mealType,
    required this.dishCount,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? mealType;
  final dynamic dishCount;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      mealType: json["meal_type"],
      dishCount: json["dish_count"],
    );
  }

}

class Dish {
  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isAvailable,
    required this.rating,
    required this.sizes,
    required this.createdAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final bool? isAvailable;
  final Rating? rating;
  final List<Size> sizes;
  final String? createdAt;

  factory Dish.fromJson(Map<String, dynamic> json){
    return Dish(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      imageUrl: json["image_url"],
      isAvailable: json["is_available"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      sizes: json["sizes"] == null ? [] : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      createdAt: json["created_at"],
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
