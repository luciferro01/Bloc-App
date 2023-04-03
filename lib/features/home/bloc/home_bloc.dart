// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/cart_item.dart';
import 'package:bloc_app/data/grocery_data.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:bloc_app/features/home/models/home_products_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWIshlistButtonClickedEvent>(
        homeProductWIshlistButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        GroceryData.groceryList
            .map(
              (e) => GroceryProducts(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageurl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Home Product cart Button Clicked');
    cartItemsList.add(event.clickedEvent);
    // emit(HomeProductItemCartedState());
    emit(HomeProductItemCartedActionState());
    print(cartItemsList);
  }

  FutureOr<void> homeProductWIshlistButtonClickedEvent(
      HomeProductWIshlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Home Product Wishlist Button Clicked');
    wishlistItems.add(event.clickedEvent);
    emit(HomeProductItemWishlistedActionState());
  }
}

FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
  emit(HomeNavigateToCartPageActionState());
}

FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
  emit(HomeNavigateToWishlistPageActionState());
}
