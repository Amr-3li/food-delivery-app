class SizeModel {
  final int id;
  final String size;
  final double price;
  final String currency;

  SizeModel({
    required this.id,
    required this.size,
    required this.price,
    required this.currency,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      id: json['id'],
      size: json['size'],
      price: json['price'].toDouble(),
      currency: json['currency'],
    );
  }
}

class MealModel {
  final int id;
  final String name;
  final String? description;
  final String? image;
  final bool isAvailable;
  final double rating;
  final int totalReviews;
  final List<SizeModel> sizes;

  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.isAvailable,
    required this.rating,
    required this.totalReviews,
    required this.sizes,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      isAvailable: json['is_available'],
      rating: json['rating']['average'].toDouble(),
      totalReviews: json['rating']['total_reviews'],
      sizes: (json['sizes'] as List)
          .map((item) => SizeModel.fromJson(item))
          .toList(),
    );
  }
}

// class CategoryModel {
//   final int id;
//   final String name;
//   final String? image;
//   final String mealType;
//   final List<MealModel> meals;

//   CategoryModel({
//     required this.id,
//     required this.name,
//     this.image,
//     required this.mealType,
//     required this.meals,
//   });

// factory CategoryModel.fromJson(Map<String, dynamic> json) {
//   return CategoryModel(
//     id: json['category']['id'],
//     name: json['category']['name'] ?? 'Unnamed Category',
//     image:
//         json['category']['image'] ??
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzDXmfrBvj-07Fz17-V1BCk9C16ODy8yGGCQ&s",

//     mealType: json['category']['meal_type'] ?? '',
//     meals: (json['meals'] as List)
//         .map((meal) => MealModel.fromJson(meal))
//         .toList(),
//   );
// }
//}

class RestaurantModel {
  final int id;
  final String? name;
  final String? description;
  final String? location;
  final String? profileImage;
  final String? bio;
  final String? phone;
  final String? email;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.profileImage,
    required this.bio,
    required this.phone,
    required this.email,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      profileImage:
          json['profile_image'] ??
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzDXmfrBvj-07Fz17-V1BCk9C16ODy8yGGCQ&s",
      bio: json['bio'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

class RestaurantViewModel {
  final RestaurantModel restaurant;
  // final List<CategoryModel> categories;

  RestaurantViewModel({
    required this.restaurant,
    // required this.categories
  });

  factory RestaurantViewModel.fromJson(Map<String, dynamic> json) {
    return RestaurantViewModel(
      restaurant: RestaurantModel.fromJson(json['Resturant']),
      //   categories: (json['menu']['categories'] as List)
      //       .map((e) => CategoryModel.fromJson(e))
      //       .toList(),
    );
  }
}
