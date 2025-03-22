import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:gooddeals/features/ShoppingItems/data/models/Items_model.dart';
import 'dart:convert';
import 'dart:async';
part 'Items_api_service.g.dart';


@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ItemsApiService {
  factory ItemsApiService(Dio dio) = _ItemsApiService;

  @GET('/products')
  Future<HttpResponse<Map<String, dynamic>>> getItems();
}

class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    print('Error: $error');
    print('StackTrace: $stackTrace');
    print('RequestOptions: $options');
  }
}
