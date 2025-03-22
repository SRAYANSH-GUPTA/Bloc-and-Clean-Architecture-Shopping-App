import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';
import 'package:floor/floor.dart';
import 'package:gooddeals/features/ShoppingItems/data/data_sources/local/string_list_converter.dart';
import 'package:gooddeals/features/ShoppingItems/data/converters/review_converter.dart';
import 'package:gooddeals/features/ShoppingItems/data/converters/meta_converter.dart';

@Entity(tableName: 'cart', primaryKeys: ['id'])
@TypeConverters([StringListConverter, ReviewConverter, MetaConverter])
class ItemsModel extends Product {
  const ItemsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    required super.brand,
    required super.sku,
    required super.weight,

    required super.warrantyInformation,
    required super.shippingInformation,
    required super.availabilityStatus,
    required super.reviews,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required super.meta,
    required super.images,
    required super.thumbnail,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      tags: (json['tags'] as List?)?.map((e) => e as String).toList() ?? [],
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'] ?? 0,

      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews:
          (json['reviews'] as List?)
              ?.map((review) => Review.fromJson(review as Map<String, dynamic>))
              .toList() ??
          [],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      images: (json['images'] as List?)?.map((e) => e as String).toList() ?? [],
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
