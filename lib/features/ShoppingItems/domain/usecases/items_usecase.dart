import 'package:gooddeals/core/usecase/usecase.dart';
import 'package:gooddeals/core/resources/api_data_state.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';
import 'package:gooddeals/features/ShoppingItems/domain/repositories/Items_repository.dart';

class GetItemsUsecase implements Usecase<DataState<List<Product>>, void> {
  final ItemsRepository _itemsRepository;
  GetItemsUsecase(this._itemsRepository);
  @override
  Future<DataState<List<Product>>> call({void params}) {
    return _itemsRepository.getItems();
  }
}
