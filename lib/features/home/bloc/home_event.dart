part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final GroceryProducts clickedEvent;
  HomeProductCartButtonClickedEvent(this.clickedEvent);
}

class HomeProductWIshlistButtonClickedEvent extends HomeEvent {
  final GroceryProducts clickedEvent;

  HomeProductWIshlistButtonClickedEvent(this.clickedEvent);
}

class HomeCartButtonNavigateEvent extends HomeEvent {}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}
