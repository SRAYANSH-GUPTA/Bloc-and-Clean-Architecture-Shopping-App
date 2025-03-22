import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_state.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/widget/Item_display_widget.dart';
import 'package:retrofit/http.dart';

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
          Stack(
            children: [GestureDetector(
              onTap: (){},
              child: Icon(Icons.shopping_bag),
            ),
            Positioned(
              top: 8,
              right: 8,
              child:Container()

            )]
          ),
        ],
      ),
      body:
        BlocBuilder<RemoteItemsBloc, RemoteItemsState>(
          builder: (_, state) {
            if (state is RemoteItemsLoading) {
              return LinearProgressIndicator();
            } else if (state is RemoteItemsDone) {
              return GridView.builder(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.7
                ),
                itemCount: state.product!.length,
                itemBuilder: (context, index) {
                  return ItemDisplayWidget(product: state.product![index]);
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
