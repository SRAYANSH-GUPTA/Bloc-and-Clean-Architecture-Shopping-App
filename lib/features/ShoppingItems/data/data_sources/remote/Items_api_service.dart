import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:gooddeals/features/ShoppingItems/data/models/Items_model.dart';
import 'package:gooddeals/core/resources/api_data_state.dart';
part 'Items_api_service.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ItemsApiService {
  factory ItemsApiService(Dio dio) = _ItemsApiService;

  @GET('/products')
  Future<HttpResponse<List<ItemsModel>>> getItems();
}

class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    print('Error: $error');
    print('StackTrace: $stackTrace');
    print('RequestOptions: $options');
  }
}
