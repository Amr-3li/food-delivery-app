import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/search/data/search_model/search_model.dart';
import 'package:restaurant/features/search/data/search_repos/search_repo.dart';

class SearchRepoImplementation extends SearchRepo {
  final Dio dio = Dio();
  @override
  Future<Either<List<SearchModel>, Failure>> searchRequest({
    required String search,
  }) async {
    try {
      final response = await dio.get(
        "${EndPoints.baseUrl}${EndPoints.searchPage}",
        queryParameters: {'search': search},
      );
      if (response.statusCode == 200) {
        List<SearchModel> listOfResult = [];
        for (var result in response.data) {
          listOfResult.add(SearchModel.fromJson(result));
        }

        return left(listOfResult);
      } else {
        return right(Failure(errorMessage: response.data["message"]));
      }
    } catch (error) {
      final apiResponse = ApiResponse.fromError(error);
      return right(Failure(errorMessage: apiResponse.message));
    }
  }

  @override
  Future<Either<List<SearchModel>, Failure>> filterRequest({
    required int rate,
    required int price,
  }) async {
    try {
      final response = await dio.get(
        "${EndPoints.baseUrl}${EndPoints.filterSearch(rate, price)}",
      );
      if (response.statusCode == 200) {
        List<SearchModel> listOfResult = [];
        for (var result in response.data) {
          listOfResult.add(SearchModel.fromJson(result));
        }
        return left(listOfResult);
      } else {
        return right(Failure(errorMessage: response.data["message"]));
      }
    } catch (error) {
      final apiResponse = ApiResponse.fromError(error);
      return right(Failure(errorMessage: apiResponse.message));
    }
  }
}
