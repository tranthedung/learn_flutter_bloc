import 'dart:async';

import 'package:flutter_bloc_test/data/grocery_data.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../model/home_product_data_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist product Clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart product Clicked');
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('wishlish navigate clicked');
    emit(HomeNavigateToWishlishPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
