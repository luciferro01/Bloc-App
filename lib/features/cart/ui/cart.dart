import 'package:bloc_app/data/cart_item.dart';
import 'package:bloc_app/features/cart/bloc/cart_bloc.dart';
// import 'package:bloc_app/features/home/models/home_products_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_tile.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent(cartItemsList));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartItemLoadedSuccessState:
              final successState = state as CartItemLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Grocery App'),
                  centerTitle: true,
                ),
                body: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.black,
                      );
                    },
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTile(
                        cartBloc: cartBloc,
                        groceryProducts: successState.cartItems[index],
                      );
                    }),
              );
            default:
              return const Scaffold(
                body: Center(child: Text('Error')),
              );
          }
        });
  }
}
