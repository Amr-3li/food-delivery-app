import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/home/data/repository/chef_statistics/revenue_repository.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/chef_statistics/chef_statistics_state.dart';

class ChefStatisticsCubit extends Cubit<ChefStatisticsState> {
  final ChefStatisticsRepository repository;
  bool _hasFetchedInitialData = false;

  ChefStatisticsCubit(this.repository) : super(ChefStatisticsInitial());

  Future<void> fetchInitialData({String period = 'today'}) async {
    if (_hasFetchedInitialData) return;
    _hasFetchedInitialData = true;

    emit(ChefStatisticsLoading());
    try {
      final statistics = await repository.fetchChefStatistics(period: period);
      emit(ChefStatisticsLoaded(statistics));
    } catch (e) {
      emit(ChefStatisticsError(e.toString()));
      _hasFetchedInitialData = false;
    }
  }

  Future<void> refreshData({String period = 'today'}) async {
    emit(ChefStatisticsLoading());
    try {
      final statistics = await repository.fetchChefStatistics(period: period);
      emit(ChefStatisticsLoaded(statistics));
    } catch (e) {
      emit(ChefStatisticsError(e.toString()));
    }
  }
}
