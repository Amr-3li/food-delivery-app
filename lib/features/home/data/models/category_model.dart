class CategoryHomeModel {
  final int id;
  final String name;
  final String image;
  final String mealType;
  final String? description;

  CategoryHomeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.mealType,
    this.description,
  });

  factory CategoryHomeModel.fromJson(Map<String, dynamic> json) {
    return CategoryHomeModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      mealType: json['meal_type'],
      description: json['description'] ?? '', // Optional field
    );
  }
}
