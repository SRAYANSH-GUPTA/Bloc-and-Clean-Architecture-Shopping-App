import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';

abstract class RemoteItemsState extends Equatable {
  final List<Product>? product;
  final DioException? error;
  const RemoteItemsState({this.product, this.error});

  @override
  List<Object> get props => [product!, error!];
}

class RemoteItemsLoading extends RemoteItemsState {
  const RemoteItemsLoading();
}

class RemoteItemsDone extends RemoteItemsState {
  const RemoteItemsDone(List<Product> product) : super(product: product);
}

class RemoteItemsError extends RemoteItemsState {
  const RemoteItemsError(DioException error) : super(error: error);
}
