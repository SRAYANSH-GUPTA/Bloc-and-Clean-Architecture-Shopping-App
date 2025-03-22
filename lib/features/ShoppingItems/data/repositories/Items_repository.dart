import 'dart:io';
import 'dart:math';
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
   try
   {
     final httpresponse = await _apiService.getItems();
    if (httpresponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpresponse.data);
    } else {
      return DataFailed(
        DioException(
          error: httpresponse.response.statusMessage,
          response: httpresponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpresponse.response.requestOptions
        ),
      );
    }
    
   }
   on DioException catch(e)
    {
      return DataFailed(e);
    }
  }
}
