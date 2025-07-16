import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/chief_part/home/data/models/chef_review';

abstract class BaseChefReviewsRepository {
  Future<ChefReviewsSummary> getChefReviewsSummary(int chefId);
}

class ChefReviewsRepository implements BaseChefReviewsRepository {
  final ApiHelper apiHelper;

  ChefReviewsRepository({required this.apiHelper});

  @override
  Future<ChefReviewsSummary> getChefReviewsSummary(int chefId) async {
    final response = await apiHelper.getRequest(
      endPoint: 'chefs/$chefId/reviews/',
      isProtected: true,
    );

    if (response.status) {
      // Extract only the data we need from the response
      final data = response.data['data'];
      return ChefReviewsSummary.fromJson(data);
    } else {
      throw Exception('Failed to load chef reviews: ${response.message}');
    }
  }
}
