part of 'home_bloc.dart';
// import '../models/home_products_data_model.dart';

@immutable
abstract class HomeState {}

class HomeActionSate extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<GroceryProducts> groceryProducts;
  HomeLoadedSuccessState(this.groceryProducts);
}

class HomeLoadErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionSate {}

class HomeNavigateToCartPageActionState extends HomeActionSate {}

class HomeProductItemWishlistedActionState extends HomeActionSate {}

class HomeProductItemCartedActionState extends HomeActionSate {}
