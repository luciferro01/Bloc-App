import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/cart_item.dart';
import 'package:bloc_app/features/home/models/home_products_data_model.dart';
// import 'package:bloc_app/features/home/models/home_products_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartItemRemoveEvent>(cartItemRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartItemLoadedSuccessState(cartItems: event.groceryProducts));
  }

  FutureOr<void> cartItemRemoveEvent(
      CartItemRemoveEvent event, Emitter<CartState> emit) {
    cartItemsList.remove(event.groceryProducts);
    emit(CartItemLoadedSuccessState(cartItems: cartItemsList));
    // emit(CartItemRemovedState());
  }
}
