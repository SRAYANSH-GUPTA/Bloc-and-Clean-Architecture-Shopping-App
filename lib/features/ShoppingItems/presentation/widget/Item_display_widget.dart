import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ItemDisplayWidget extends StatelessWidget {
  final Product product;
  final Function(Product)? onAddToCart;

  const ItemDisplayWidget({super.key, required this.product, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    final double discountedPrice =
        product.price * (1 - product.discountPercentage / 100);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) => LinearProgressIndicator(
                    color: Colors.lightBlue,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl: product.thumbnail,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: ElevatedButton(
                    onPressed: () {
                      if (onAddToCart != null) {
                        onAddToCart!(product);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Add',
                    style: TextStyle(color: Colors.pinkAccent),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(product.brand, style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,maxLines: 1,),
                  Text(
                    '₹${discountedPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '₹${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${product.discountPercentage}% OFF',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
