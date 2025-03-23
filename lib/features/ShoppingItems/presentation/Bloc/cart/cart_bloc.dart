import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';


abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Product product;
  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;
  RemoveFromCartEvent(this.product);
}


class CartItem {
  final Product product;
  final int quantity;

  CartItem(this.product, this.quantity);
}

abstract class CartState {
  final List<CartItem> items;
  final double total;
  CartState(this.items, this.total);
}

class CartInitial extends CartState {
  CartInitial() : super([], 0);
}

class CartLoaded extends CartState {
  CartLoaded(List<CartItem> items, double total) : super(items, total);
}


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final currentItems = List<CartItem>.from(state.items);
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (existingItemIndex != -1) {
      
      currentItems[existingItemIndex] = CartItem(
        currentItems[existingItemIndex].product,
        currentItems[existingItemIndex].quantity + 1,
      );
    } else {
      
      currentItems.add(CartItem(event.product, 1));
    }

    final total = _calculateTotal(currentItems);
    emit(CartLoaded(currentItems, total));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final currentItems = List<CartItem>.from(state.items);
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (existingItemIndex != -1) {
      if (currentItems[existingItemIndex].quantity > 1) {
        
        currentItems[existingItemIndex] = CartItem(
          currentItems[existingItemIndex].product,
          currentItems[existingItemIndex].quantity - 1,
        );
      } else {
        
        currentItems.removeAt(existingItemIndex);
      }
    }

    final total = _calculateTotal(currentItems);
    emit(CartLoaded(currentItems, total));
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0, (sum, item) {
      final discountedPrice =
          item.product.price * (1 - item.product.discountPercentage / 100);
      return sum + (discountedPrice * item.quantity);
    });
  }
}
