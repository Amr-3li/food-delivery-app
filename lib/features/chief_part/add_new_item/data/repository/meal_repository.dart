abstract class MealRepository {
  Future<void> createMeal({
    required String name,
    required String description,
    required String imagePath,
    required double price,
    required int categoryId,
    required bool isAvailable,
  });
}
