class FavoritesModel {
  FavoritesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;

  factory FavoritesModel.fromJson(Map<String, dynamic> json){
    return FavoritesModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.dishId,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
    required this.dish,
  });

  final int? id;
  final int? dishId;
  final int? customerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Dish? dish;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      dishId: json["dish_id"],
      customerId: json["customer_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      dish: json["dish"] == null ? null : Dish.fromJson(json["dish"]),
    );
  }

}

class Dish {
  Dish({
    required this.id,
    required this.chefId,
    required this.name,
    required this.description,
    required this.image,
    required this.isAvailable,
    required this.totalRate,
    required this.avgRate,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? chefId;
  final String? name;
  final String? description;
  final String? image;
  final bool? isAvailable;
  final int? totalRate;
  final String? avgRate;
  final int? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Dish.fromJson(Map<String, dynamic> json){
    return Dish(
      id: json["id"],
      chefId: json["chef_id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      isAvailable: json["is_available"],
      totalRate: json["total_rate"],
      avgRate: json["avg_rate"],
      categoryId: json["category_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
