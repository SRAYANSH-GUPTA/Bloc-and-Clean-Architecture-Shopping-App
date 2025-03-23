import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:gooddeals/features/ShoppingItems/data/data_sources/remote/Items_api_service.dart';
import 'package:gooddeals/features/ShoppingItems/data/repositories/Items_repository.dart';
import 'package:gooddeals/features/ShoppingItems/domain/repositories/Items_repository.dart';
import 'package:gooddeals/features/ShoppingItems/domain/usecases/items_usecase.dart';
import 'package:gooddeals/features/ShoppingItems/domain/usecases/get_saved_items.dart';
import 'package:gooddeals/features/ShoppingItems/domain/usecases/save_item.dart';
import 'package:gooddeals/features/ShoppingItems/domain/usecases/remove_item.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/data/data_sources/local/app_database.dart';

final sl = GetIt.instance;

Future<void> InitDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ItemsApiService>(ItemsApiService(sl()));
  sl.registerSingleton<ItemsRepository>(ItemsRepositoryImpl(sl(), sl()));
  sl.registerSingleton<GetItemsUsecase>(GetItemsUsecase(sl()));
  sl.registerFactory<RemoteItemsBloc>(() => RemoteItemsBloc(sl()));
  sl.registerSingleton<GetSavedItemsUsecase>(GetSavedItemsUsecase(sl()));
  sl.registerSingleton<SaveItemUsecase>(SaveItemUsecase(sl()));
  sl.registerSingleton<RemoveItem>(RemoveItem(sl()));

  log("Dependences initialized");
}
