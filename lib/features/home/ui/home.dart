import 'package:bloc_app/features/cart/ui/cart.dart';
import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/features/home/ui/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionSate,
      buildWhen: (previous, current) => current is! HomeActionSate,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const Cart()),
            ),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const Wishlist()),
            ),
          );
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Item added to the cart'),
            duration: Duration(seconds: 2),
          ));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Item added to the wishlist',
            ),
            duration: Duration(seconds: 2),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  )
                ],
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
                  itemCount: successState.groceryProducts.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      homeBloc: homeBloc,
                      groceryData: successState.groceryProducts[index],
                    );
                  }),
            );

          case HomeLoadErrorState:
            return const Scaffold(
              body: Center(child: Text('Error')),
            );

          default:
            return const Scaffold(
              body: Center(child: Text('Error')),
            );
        }
      },
    );
  }
}
