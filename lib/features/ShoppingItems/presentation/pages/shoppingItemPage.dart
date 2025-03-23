import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_state.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/widget/Item_display_widget.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/pages/cart_page.dart';
import 'package:gooddeals/injection_container.dart';
import 'package:gooddeals/features/ShoppingItems/domain/repositories/Items_repository.dart';
import 'package:gooddeals/features/ShoppingItems/data/repositories/Items_repository.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/cart/cart_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/domain/entities/ItemEntity.dart';

class ShoppingItems extends StatefulWidget {
  const ShoppingItems({super.key});

  @override
  State<ShoppingItems> createState() => _ShoppingItemsState();
}

class _ShoppingItemsState extends State<ShoppingItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
        centerTitle: true,
        elevation: 5,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                  ),
                  if (state.items.isNotEmpty)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${state.items.length}',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RemoteItemsBloc, RemoteItemsState>(
        builder: (_, state) {
          if (state is RemoteItemsLoading) {
            return LinearProgressIndicator();
          } else if (state is RemoteItemsDone) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: state.product!.length,
              itemBuilder: (context, index) {
                return ItemDisplayWidget(
                  product: state.product![index],
                  onAddToCart: (product) {
                    context.read<CartBloc>().add(AddToCartEvent(product));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is RemoteItemsError) {
            return Text(state.error.toString());
          }
          return SizedBox();
        },
      ),
    );
  }
}
