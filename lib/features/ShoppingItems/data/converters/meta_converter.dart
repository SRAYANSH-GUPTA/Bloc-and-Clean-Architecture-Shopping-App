import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';

class MetaConverter extends TypeConverter<Meta, String> {
  @override
  Meta decode(String databaseValue) {
    final Map<String, dynamic> json = jsonDecode(databaseValue);
    return Meta.fromJson(json);
  }

  @override
  String encode(Meta value) {
    return json.encode(value.toJson());
  }
}
