import 'package:restaurant/core/utils/constant_text.dart';
import 'package:restaurant/core/network/api_helper.dart';
import '../models/restaurant_model.dart';

class RestaurantRepository {
  ApiHelper apiHelper = ApiHelper();
  RestaurantRepository();

  Future<List<RestaurantModel>> fetchRestaurants() async {
    final response = await apiHelper.getRequest(
      endPoint: "${APIKey.baseApiUrl}/open-resturants",
    );
    final List data = response.data['data'];
    return data.map((e) => RestaurantModel.fromJson(e)).toList();
  }
}
