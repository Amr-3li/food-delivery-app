import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';

class FoodDetails {
  final String name;
  final List<ItemImage> images;
  final int categoryId;
  final String description;
  final double price;
  final bool isAvailable;
  final List<String> ingredients;
  final String size; // Made this a constant value

  const FoodDetails({
    this.name = '',
    this.images = const [],
    this.categoryId = 1,
    this.description = '',
    this.price = 20.0,
    this.isAvailable = true,
    this.ingredients = const ['salt'],
    this.size = 'medium', // Constant size value
  });

  FoodDetails copyWith({
    String? id,
    String? name,
    List<ItemImage>? images,
    int? categoryId,
    String? description,
    double? price,
    bool? isAvailable,
    List<String>? ingredients,
    String? size,
  }) {
    return FoodDetails(
      name: name ?? this.name,
      images: images ?? this.images,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      ingredients: ingredients ?? this.ingredients,
      size:
          size ?? this.size, // Keep the constant size unless explicitly changed
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': images.isNotEmpty
          ? images.first.file.path
          : null, // Only first image
      'category_id': categoryId,
      'description': description,
      'price': price,
      'is_available': isAvailable ? 1 : 0,
      'ingredients[0]': ingredients.isNotEmpty ? ingredients.first : 'salt',
      'sizes[0][size]': 'medium',
      'sizes[0][price]': price.toString(),
    };
  }
}
