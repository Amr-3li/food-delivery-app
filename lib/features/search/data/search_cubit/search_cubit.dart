import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/search/data/search_cubit/search_states.dart';
import 'package:restaurant/features/search/data/search_repos/search_repo.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit(this.searchRepo):super(InitialState());
final SearchRepo searchRepo;
getResult({required String search}){
emit(LoadingState());
var result = searchRepo.searchRequest(search: search);

}

}