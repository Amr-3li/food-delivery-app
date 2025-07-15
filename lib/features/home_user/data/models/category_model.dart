class CategoryModel {
  final int id;
  final String name;
  final String image;
  final String mealType;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.mealType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      mealType: json['meal_type'],
    );
  }
}
