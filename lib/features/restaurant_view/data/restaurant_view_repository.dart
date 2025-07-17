import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_model.dart';

class RestaurantViewRepository {
  ApiHelper apiHelper = ApiHelper();

  RestaurantViewRepository();

  Future<RestaurantViewModel> fetchRestaurantView(int id) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: '${APIKey.baseApiUrl}/resturants/$id',
      );

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

  Future<RestaurantViewModel> fetchFilteredRestaurantView(
    int rate,
    int price,
  ) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.filterSearch(rate, price),
      );

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
