import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/search/data/search_cubit/search_states.dart';
import 'package:restaurant/features/search/data/search_repos/search_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(InitialState());

  Future<void> searchRequest({required String search}) async {
    emit(LoadingState());
    final result = await searchRepo.searchRequest(search: search);
    result.fold(
      (success) => emit(SuccessSearch(results: success)),
      (failure) => emit(FailureState(errorMessage: failure.errorMessage)),
    );
  }

  Future<void> filterRequest({required int rate, required int price}) async {
    emit(LoadingState());
    final result = await searchRepo.filterRequest(rate: rate, price: price);
    result.fold(
      (success) => emit(SuccessSearch(results: success)),
      (failure) => emit(FailureState(errorMessage: failure.errorMessage)),
    );
  }
}
