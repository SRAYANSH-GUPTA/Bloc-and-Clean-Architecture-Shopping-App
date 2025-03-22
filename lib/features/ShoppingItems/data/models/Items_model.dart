import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';

class ItemsModel extends Product {
  ItemsModel({required super.id, required super.title, required super.description, required super.category, required super.price, required super.discountPercentage, required super.rating, required super.stock, required super.tags, required super.brand, required super.sku, required super.weight, required super.dimensions, required super.warrantyInformation, required super.shippingInformation, required super.availabilityStatus, required super.reviews, required super.returnPolicy, required super.minimumOrderQuantity, required super.meta, required super.images, required super.thumbnail});
  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
      tags: json['tags'],
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      dimensions: json['dimensions'],
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: json['reviews'],
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'],
      images: json['images'],
      thumbnail: json['thumbnail'],
    );
  }
}

