// meal_model.dart
import 'dart:io';
import 'package:flutter/material.dart';

class MealApiResponse {
  final bool success;
  final String message;
  final List<Meal> data;
  final Meta meta;

  MealApiResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory MealApiResponse.fromJson(Map<String, dynamic> json) {
    return MealApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: List<Meal>.from(json['data'].map((x) => Meal.fromJson(x))),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Meal {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final bool isAvailable;
  final Rating rating;
  final List<MealSize> sizes;
  final MealCategory category;
  final String createdAt;

  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isAvailable,
    required this.rating,
    required this.sizes,
    required this.category,
    required this.createdAt,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isAvailable: json['is_available'] ?? false,
      rating: Rating.fromJson(json['rating']),
      sizes: List<MealSize>.from(
        (json['sizes'] ?? []).map((x) => MealSize.fromJson(x)),
      ),
      category: MealCategory.fromJson(json['category']),
      createdAt: json['created_at'] ?? '',
    );
  }

  String get smallestPrice {
    if (sizes.isEmpty) return 'N/A';
    final smallest = sizes.reduce(
      (curr, next) => curr.price < next.price ? curr : next,
    );
    return '${smallest.price} ${smallest.currency}';
  }

  // Helper method to get meal image widget
  Widget getMealImage({double? width, double? height, BoxFit? fit}) {
    if (imageUrl.startsWith('http')) {
      return Image.network(imageUrl, width: width, height: height, fit: fit);
    } else if (imageUrl.startsWith('storage/')) {
      return Image.file(File(imageUrl), width: width, height: height, fit: fit);
    } else {
      return Placeholder(
        fallbackWidth: width ?? 100,
        fallbackHeight: height ?? 100,
      );
    }
  }

  // Helper method to get category image widget
  Widget getCategoryImage({double? width, double? height, BoxFit? fit}) {
    return Image.network(
      category.image,
      width: width,
      height: height,
      fit: fit,
    );
  }
}

class Rating {
  final double average;
  final int totalReviews;

  Rating({required this.average, required this.totalReviews});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] is int)
          ? (json['average'] as int).toDouble()
          : json['average'] ?? 0.0,
      totalReviews: json['total_reviews'] ?? 0,
    );
  }

  String get formattedAverage => average.toStringAsFixed(1);
}

class MealSize {
  final int id;
  final String size;
  final double price;
  final String currency;

  MealSize({
    required this.id,
    required this.size,
    required this.price,
    required this.currency,
  });

  factory MealSize.fromJson(Map<String, dynamic> json) {
    return MealSize(
      id: json['id'] ?? 0,
      size: json['size'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'] ?? 0.0,
      currency: json['currency'] ?? '',
    );
  }
}

class MealCategory {
  final int id;
  final String name;
  final String image;
  final String mealType;
  final String? description;

  MealCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.mealType,
    this.description,
  });

  factory MealCategory.fromJson(Map<String, dynamic> json) {
    return MealCategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      mealType: json['meal_type'] ?? '',
      description: json['description'],
    );
  }
}

class Meta {
  final int total;
  final int chefId;

  Meta({required this.total, required this.chefId});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(total: json['total'] ?? 0, chefId: json['chef_id'] ?? 0);
  }
}
