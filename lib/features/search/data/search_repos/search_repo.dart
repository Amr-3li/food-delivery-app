import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/search/data/search_model/search_model.dart';

abstract class SearchRepo {
Future <Either<List<SearchModel> , Failure>> searchRequest({required String search});
}