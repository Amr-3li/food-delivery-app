class FoodModel {
  final int id;
  final String name;
  final String image;
  final String mealType;

  FoodModel({
    required this.id,
    required this.name,
    required this.image,
    required this.mealType,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      mealType: json['meal_type'] ?? '',
    );
  }
}
