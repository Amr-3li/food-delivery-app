class RestaurantModel {
  final int id;
  final String name;
  final String description;
  final String location;
  final String profileImage;
  final double averageRating;
  final int totalReviews;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.profileImage,
    required this.averageRating,
    required this.totalReviews,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      profileImage: json['profile_image'] ?? '',
      averageRating: (json['rating']['average'] as num).toDouble(),
      totalReviews: json['rating']['total_reviews'],
    );
  }
}
