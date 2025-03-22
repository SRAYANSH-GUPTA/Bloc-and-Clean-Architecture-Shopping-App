import 'package:floor/floor.dart';
import 'package:gooddeals/features/ShoppingItems/data/models/Items_model.dart';

@dao
abstract class CartDao {
  @Insert()
  Future<void> addItems(ItemsModel item);
  @delete
  Future<void> deleteItems(ItemsModel item);
  @Query('SELECT * FROM cart')
  Future<List<ItemsModel>> getItems();
}


