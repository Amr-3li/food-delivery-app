import 'package:dio/dio.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/features/reviews/data/models/add_review_model.dart';
import 'package:restaurant/features/reviews/data/models/review_model.dart';

class ReviewsApiService {
  final Dio dio;

  ReviewsApiService({required this.dio});
  Map<String, dynamic> _getHeaders() {
    return {
      'Authorization':
          'Bearer 1|0RANyvprNDP4Op4J00bd0cARAcRKUSIOQd1W9dXG3d058ffd',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<List<ReviewModel>> fetchReviews() async {
    final response = await dio.get(
      '${APIKey.baseApiUrl}/reviews',
      options: Options(headers: _getHeaders()),
    );

    final List<dynamic> jsonList = response.data['data']['reviews'];
    return jsonList.map((e) => ReviewModel.fromJson(e)).toList();
  }

  Future<void> postReview(AddReviewRequest request) async {
    await dio.post('${APIKey.baseApiUrl}/reviews', data: request.toJson());
  }
}
