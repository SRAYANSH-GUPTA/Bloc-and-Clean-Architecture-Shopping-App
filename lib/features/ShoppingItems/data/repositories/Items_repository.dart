import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gooddeals/core/resources/api_data_state.dart';
import 'package:gooddeals/features/ShoppingItems/data/data_sources/remote/Items_api_service.dart';
import 'package:gooddeals/features/ShoppingItems/data/models/Items_model.dart';
import 'package:gooddeals/features/ShoppingItems/domain/repositories/Items_repository.dart';

class ItemsRepositoryImpl extends ItemsRepository {
  final ItemsApiService _apiService;
  ItemsRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<ItemsModel>>> getItems() async {
    try {
      final httpResponse = await _apiService.getItems();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // Extract the products array from the response
        final List<dynamic> productsJson =
            httpResponse.data['products'] as List;
        final products =
            productsJson
                .map(
                  (json) => ItemsModel.fromJson(json as Map<String, dynamic>),
                )
                .toList();
        return DataSuccess(products);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
