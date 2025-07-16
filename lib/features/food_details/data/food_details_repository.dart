import 'package:dio/dio.dart';
import 'package:restaurant/features/food_details/data/food_details_model.dart';

class FoodDetailsRepository {
  final Dio dio;

  FoodDetailsRepository({required this.dio});

  Future<FoodDetailsModel> fetchFoodDetails() async {
    await Future.delayed(const Duration(seconds: 1)); 

    return FoodDetailsModel(
      dishName: "Koshari",
      dishImage: "https://images.unsplash.com/photo-1544807976-9b2b24998552?w=500",
      totalRate: 127,
      avgRate: "4.80",
      chefLocation: "Sheikh Zayed, Giza, Egypt",
      description:
          "Egypt's national dish with rice, lentils, pasta, crispy onions, and spicy tomato sauce",
      categoryName: "Egyptian Cuisine",
      ingredient: "Rice",
    );
  }
}
