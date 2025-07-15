// lib/features/chief_part/home/data/repository/chef_statistics/revenue_repository.dart
import 'package:dio/dio.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/chief_part/home/data/models/chef_statistics_model.dart';
import 'package:restaurant/features/chief_part/home/data/repository/chef_statistics/revenue_repository.dart';

class ChefStatisticsRepositoryImpl implements ChefStatisticsRepository {
  final ApiHelper apiHelper;

  ChefStatisticsRepositoryImpl(this.apiHelper);

  @override
  Future<ChefStatistics> fetchChefStatistics({String period = 'today'}) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.chefStatistics,
        data: {'period': period},
        isProtected: true,
        isFormData: false,
      );

      if (response.status && response.data != null) {
        return ChefStatistics.fromJson(response.data['data']);
      } else {
        throw Exception(response.message);
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ??
            e.message ??
            'Failed to load chef statistics',
      );
    } catch (e) {
      throw Exception('Failed to load chef statistics: ${e.toString()}');
    }
  }
}
