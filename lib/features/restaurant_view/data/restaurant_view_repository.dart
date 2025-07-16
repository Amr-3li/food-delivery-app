import 'package:dio/dio.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_model.dart';

class RestaurantViewRepository {
  final String baseUrl;
  final Dio dio;

  RestaurantViewRepository({required this.baseUrl}) : dio = Dio();

  Future<RestaurantViewModel> fetchRestaurantView() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        final json = response.data;
        if (json['success'] == true) {
          final data = json['data'];
          return RestaurantViewModel.fromJson(data);
        } else {
          throw Exception('Error: ${json['message']}');
        }
      } else {
        throw Exception('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}
