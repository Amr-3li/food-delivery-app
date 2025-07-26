class PopularFastFoodModel {
  PopularFastFoodModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;

  factory PopularFastFoodModel.fromJson(Map<String, dynamic> json){
    return PopularFastFoodModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
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
  final int? dishAvgRate;
  final List<Size> sizes;
  final List<Ingredient> ingredients;
  final Category? category;
  final Chef? chef;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      dishId: json["dish_id"],
      dishName: json["dish_name"],
      dishImage: json["dish_image"],
      dishDescription: json["dish_description"],
      dishAvgRate: json["dish_avg_rate"],
      sizes: json["sizes"] == null ? [] : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      chef: json["chef"] == null ? null : Chef.fromJson(json["chef"]),
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

class Chef {
  Chef({
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

  factory Chef.fromJson(Map<String, dynamic> json){
    return Chef(
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

class Size {
  Size({
    required this.id,
    required this.dishId,
    required this.size,
    required this.price,
  });

  final int? id;
  final int? dishId;
  final String? size;
  final String? price;

  factory Size.fromJson(Map<String, dynamic> json){
    return Size(
      id: json["id"],
      dishId: json["dish_id"],
      size: json["size"],
      price: json["price"],
    );
  }

}
