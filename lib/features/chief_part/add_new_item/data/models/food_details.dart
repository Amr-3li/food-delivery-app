import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';

class FoodDetails {
  final String id;
  final String name;
  final List<ItemImage> images;
  final String foodType;
  final String deliveryType;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;

  const FoodDetails({
    this.id = '',
    this.name = '',
    this.images = const [],
    this.foodType = 'Main Course',
    this.deliveryType = 'pickup',
    this.description = '',
    this.price = 0.0,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  FoodDetails copyWith({
    String? id,
    String? name,
    List<ItemImage>? images,
    String? foodType,
    String? deliveryType,
    String? description,
    double? price,
    double? rating,
    int? reviewCount,
  }) {
    return FoodDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      foodType: foodType ?? this.foodType,
      deliveryType: deliveryType ?? this.deliveryType,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'images': images.map((img) => img.file.path).toList(),
      'foodType': foodType,
      'deliveryType': deliveryType,
      'description': description,
      'price': price,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}
