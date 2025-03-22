import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';

class ReviewConverter extends TypeConverter<List<Review>, String> {
  @override
  List<Review> decode(String databaseValue) {
    final List<dynamic> jsonList = json.decode(databaseValue);
    return jsonList.map((json) => Review.fromJson(json)).toList();
  }

  @override
  String encode(List<Review> value) {
    final List<Map<String, dynamic>> jsonList =
        value.map((review) => review.toJson()).toList();
    return json.encode(jsonList);
  }
}
