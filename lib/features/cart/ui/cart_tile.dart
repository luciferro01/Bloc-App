import 'package:bloc_app/features/home/models/home_products_data_model.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';

class CartTile extends StatelessWidget {
  final CartBloc cartBloc;
  final GroceryProducts groceryProducts;
  const CartTile(
      {required this.groceryProducts, super.key, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.maxFinite,
        height: 340,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black)),
        child: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  groceryProducts.imageUrl,
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: Text(
                groceryProducts.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black, blurRadius: 4),
                    ],
                  ),
                )),
            Positioned(
              bottom: 45,
              left: 4,
              child: Text(
                groceryProducts.description,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
            ),
            Positioned(
              left: 4,
              bottom: 0,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${groceryProducts.price.toString()}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //   cartBloc.add(
                          //       HomeProductCartButtonClickedEvent(groceryProducts));
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          // cartBloc.add(HomeProductWIshlistButtonClickedEvent(
                          //     groceryProducts));
                        },
                        icon: const Icon(Icons.favorite_border_outlined),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
