class RestaurantDetailsModel {
  RestaurantDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory RestaurantDetailsModel.fromJson(Map<String, dynamic> json){
    return RestaurantDetailsModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.resturant,
    required this.menu,
  });

  final Resturant? resturant;
  final Menu? menu;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      resturant: json["Resturant"] == null ? null : Resturant.fromJson(json["Resturant"]),
      menu: json["menu"] == null ? null : Menu.fromJson(json["menu"]),
    );
  }

}

class Menu {
  Menu({
    required this.categoriesCount,
    required this.totalDishes,
    required this.categories,
  });

  final dynamic categoriesCount;
  final dynamic totalDishes;
  final List<CategoryElement> categories;

  factory Menu.fromJson(Map<String, dynamic> json){
    return Menu(
      categoriesCount: json["categories_count"],
      totalDishes: json["total_dishes"],
      categories: json["categories"] == null ? [] : List<CategoryElement>.from(json["categories"]!.map((x) => CategoryElement.fromJson(x))),
    );
  }

}

class CategoryElement {
  CategoryElement({
    required this.category,
    required this.mealsCount,
    required this.meals,
  });

  final CategoryCategory? category;
  final dynamic mealsCount;
  final List<Meal> meals;

  factory CategoryElement.fromJson(Map<String, dynamic> json){
    return CategoryElement(
      category: json["category"] == null ? null : CategoryCategory.fromJson(json["category"]),
      mealsCount: json["meals_count"],
      meals: json["meals"] == null ? [] : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
    );
  }

}

class CategoryCategory {
  CategoryCategory({
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
  final String? description;

  factory CategoryCategory.fromJson(Map<String, dynamic> json){
    return CategoryCategory(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      mealType: json["meal_type"],
      description: json["description"],
    );
  }

}

class Meal {
  Meal({
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
  final CategoryCategory? category;
  final String? createdAt;

  factory Meal.fromJson(Map<String, dynamic> json){
    return Meal(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      imageUrl:  json["image_url"],
      isAvailable: json["is_available"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      sizes: json["sizes"] == null ? [] : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      category: json["category"] == null ? null : CategoryCategory.fromJson(json["category"]),
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

class Resturant {
  Resturant({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.profileImage,
    required this.bio,
    required this.phone,
    required this.email,
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
  final String? email;
  final Status? status;
  final Rating? rating;
  final Stats? stats;
  final DateTime? joinedAt;

  factory Resturant.fromJson(Map<String, dynamic> json){
    return Resturant(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      location: json["location"],
      profileImage: json["profile_image"],
      bio: json["bio"],
      phone: json["phone"],
      email: json["email"],
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      joinedAt: DateTime.tryParse(json["joined_at"] ?? ""),
    );
  }

}

class Stats {
  Stats({
    required this.totalDishes,
    required this.activeDishes,
    required this.categoriesCount,
  });

  final dynamic totalDishes;
  final dynamic activeDishes;
  final dynamic categoriesCount;

  factory Stats.fromJson(Map<String, dynamic> json){
    return Stats(
      totalDishes: json["total_dishes"],
      activeDishes: json["active_dishes"],
      categoriesCount: json["categories_count"],
    );
  }

}

class Status {
  Status({
    required this.isVerified,
    required this.isOpen,
    required this.balance,
  });

  final bool? isVerified;
  final bool? isOpen;
  final dynamic balance;

  factory Status.fromJson(Map<String, dynamic> json){
    return Status(
      isVerified: json["is_verified"],
      isOpen: json["is_open"],
      balance: json["balance"],
    );
  }

}
