import 'package:dio/dio.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/reviews/data/models/add_review_model.dart';
import 'package:restaurant/features/reviews/data/models/review_model.dart';

class ReviewsApiService {
  ApiHelper apiHelper = ApiHelper();

  ReviewsApiService();
  // Map<String, dynamic> _getHeaders() {
  //   return {
  //     'Authorization':
  //         'Bearer 1|0RANyvprNDP4Op4J00bd0cARAcRKUSIOQd1W9dXG3d058ffd',
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //   };
  // }

  Future<List<ReviewModel>> fetchReviews() async {
    final response = await apiHelper.getRequest(
      endPoint: '${APIKey.baseApiUrl}/reviews',
      isFormData: false,
    );

    final List<dynamic> jsonList = response.data['data']['reviews'];
    return jsonList.map((e) => ReviewModel.fromJson(e)).toList();
  }

  Future<void> postReview(AddReviewRequest request) async {
    await apiHelper.postRequest(
      endPoint: '${APIKey.baseApiUrl}/reviews',
      isProtected: true,
      data: request.toJson(),
      isFormData: false,
    );
  }
}
