import 'package:flutter/material.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';

class ItemDisplayWidget extends StatelessWidget {
  final Product product;

  const ItemDisplayWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double discountedPrice = product.price * (1 - product.discountPercentage / 100);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: 
      Container(
        child: Column(
          children: [
            Image.network(
          product.thumbnail,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        Text(product.title),
         Text('Brand: ${product.brand}'),
            Text('Original Price: \$${product.price.toStringAsFixed(2)}'),
            Text('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}'),
            Text('Discount: ${product.discountPercentage}% off'),
          ],
        ),
      )
     
    );
  }
}