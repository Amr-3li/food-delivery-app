import 'package:restaurant/features/chief_part/home/data/models/chef_statistics_model.dart';

abstract class ChefStatisticsRepository {
  Future<ChefStatistics> fetchChefStatistics({String period});
}
