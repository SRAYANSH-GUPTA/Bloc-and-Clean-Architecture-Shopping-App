import 'package:gooddeals/core/usecase/usecase.dart';
import 'package:gooddeals/core/resources/api_data_state.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';
import 'package:gooddeals/features/ShoppingItems/domain/repositories/Items_repository.dart';

class RemoveItem implements Usecase<void, Product> {
  final ItemsRepository _itemsRepository;
  RemoveItem(this._itemsRepository);
  @override
  Future<void> call({Product? params}) {
    return _itemsRepository.removeItem(params!);
  }
}
