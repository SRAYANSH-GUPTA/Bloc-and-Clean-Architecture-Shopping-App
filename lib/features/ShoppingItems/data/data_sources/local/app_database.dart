import 'package:floor/floor.dart';
import 'package:gooddeals/features/ShoppingItems/data/models/Items_model.dart';
import '../local/cart_dao.dart';
import 'package:gooddeals/features/ShoppingItems/data/data_sources/local/string_list_converter.dart';
import 'package:gooddeals/features/ShoppingItems/data/converters/review_converter.dart';
import 'package:gooddeals/features/ShoppingItems/data/converters/meta_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ItemsModel])
abstract class AppDatabase extends FloorDatabase {
  @TypeConverters([
    StringListConverter,
    ReviewConverter,
    MetaConverter,
  ]) // Register the converters
  CartDao get cartDAO;
}
