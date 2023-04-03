part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {
  final List<GroceryProducts> groceryProducts;

  CartInitialEvent(this.groceryProducts);
}

class CartItemRemoveEvent extends CartEvent {}
