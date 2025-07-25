class MealDetailsModel {
  MealDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory MealDetailsModel.fromJson(Map<String, dynamic> json){
    return MealDetailsModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.dishId,
    required this.dishName,
    required this.dishImage,
    required this.dishDescription,
    required this.dishAvgRate,
    required this.sizes,
    required this.ingredients,
    required this.category,
    required this.chef,
  });

  final int? dishId;
  final String? dishName;
  final String? dishImage;
  final String? dishDescription;
  final String? dishAvgRate;
  final List<SizeModel> sizes;
  final List<Ingredient> ingredients;
  final Category? category;
  final ChefModel? chef;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      dishId: json["dish_id"],
      dishName: json["dish_name"],
      dishImage: json["dish_image"],
      dishDescription: json["dish_description"],
      dishAvgRate: json["dish_avg_rate"],
      sizes: json["sizes"] == null ? [] : List<SizeModel>.from(json["sizes"]!.map((x) => SizeModel.fromJson(x))),
      ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      chef: json["chef"] == null ? null : ChefModel.fromJson(json["chef"]),
    );
  }

}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      name: json["name"],
    );
  }

}

class ChefModel {
  ChefModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.phone,
    required this.email,
    required this.profileImage,
  });

  final int? id;
  final String? name;
  final String? bio;
  final String? phone;
  final String? email;
  final String? profileImage;

  factory ChefModel.fromJson(Map<String, dynamic> json){
    return ChefModel(
      id: json["id"],
      name: json["name"],
      bio: json["bio"],
      phone: json["phone"],
      email: json["email"],
      profileImage: json["profile_image"],
    );
  }

}

class Ingredient {
  Ingredient({
    required this.id,
    required this.name,
    required this.type,
    required this.pivot,
  });

  final int? id;
  final String? name;
  final String? type;
  final Pivot? pivot;

  factory Ingredient.fromJson(Map<String, dynamic> json){
    return Ingredient(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );
  }

}

class Pivot {
  Pivot({
    required this.dishId,
    required this.ingredientId,
  });

  final int? dishId;
  final int? ingredientId;

  factory Pivot.fromJson(Map<String, dynamic> json){
    return Pivot(
      dishId: json["dish_id"],
      ingredientId: json["ingredient_id"],
    );
  }

}

class SizeModel {
  SizeModel({
    required this.id,
    required this.dishId,
    required this.size,
    required this.price,
  });

  final int? id;
  final int? dishId;
  final String? size;
  final String? price;

  factory SizeModel.fromJson(Map<String, dynamic> json){
    return SizeModel(
      id: json["id"],
      dishId: json["dish_id"],
      size: json["size"],
      price: json["price"],
    );
  }

}
