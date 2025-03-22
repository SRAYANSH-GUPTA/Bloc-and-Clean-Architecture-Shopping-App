import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';
import 'package:gooddeals/core/resources/api_data_state.dart';

abstract class ItemsRepository {
  Future<DataState<List<Product>>> getItems();

  Future<List<Product>> getSavedItems();
  Future<void> saveItem(Product item);
  Future<void> removeItem(Product item);
}
