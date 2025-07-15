class FoodDetailsModel {
  final String dishName;
  final String dishImage;
  final int totalRate;
  final String avgRate;
  final String chefLocation;
  final String description;
  final String categoryName;
  final String ingredient;

  FoodDetailsModel({
    required this.dishName,
    required this.dishImage,
    required this.totalRate,
    required this.avgRate,
    required this.chefLocation,
    required this.description,
    required this.categoryName,
    required this.ingredient,
  });

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) {
    return FoodDetailsModel(
      dishName: json['dish_name'] ?? '',
      dishImage: json['dish_image'] ?? '',
      totalRate: json['dish_total_rate'] ?? 0,
      avgRate: json['dish_avg_rate'] ?? '',
      chefLocation: json['chef_location'] ?? '',
      description: json['dish_description'] ?? '',
      categoryName: json['category_name'] ?? '',
      ingredient: json['ingredient_name'] ?? '',
    );
  }
}
