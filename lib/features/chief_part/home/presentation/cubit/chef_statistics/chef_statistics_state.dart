import 'package:restaurant/features/chief_part/home/data/models/chef_statistics_model.dart';

abstract class ChefStatisticsState {
  const ChefStatisticsState();
}

class ChefStatisticsInitial extends ChefStatisticsState {}

class ChefStatisticsLoading extends ChefStatisticsState {}

class ChefStatisticsLoaded extends ChefStatisticsState {
  final ChefStatistics statistics;

  const ChefStatisticsLoaded(this.statistics);
}

class ChefStatisticsError extends ChefStatisticsState {
  final String message;

  const ChefStatisticsError(this.message);
}
