part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

abstract class CartActionState extends CartState {}

class CartItemLoadedSuccessState extends CartState {
  final List<GroceryProducts> cartItems;
  CartItemLoadedSuccessState({required this.cartItems});
}

class CartItemRemovedState extends CartState {}
