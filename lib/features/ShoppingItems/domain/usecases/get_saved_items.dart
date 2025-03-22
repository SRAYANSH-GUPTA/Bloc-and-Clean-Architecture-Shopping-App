import 'package:gooddeals/core/usecase/usecase.dart';
import 'package:gooddeals/core/resources/api_data_state.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';
import 'package:gooddeals/features/ShoppingItems/domain/repositories/Items_repository.dart';

class GetSavedItemsUsecase implements Usecase<List<Product>, void> {
  final ItemsRepository _itemsRepository;
  GetSavedItemsUsecase(this._itemsRepository);
  @override
  Future<List<Product>> call({void params}) {
        return _itemsRepository.getSavedItems();
  }
}
