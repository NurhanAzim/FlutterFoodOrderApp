import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order/common/cart_items.dart';
import 'package:food_order/common/cuisine_data.dart';
import 'package:food_order/common/wishlist_item.dart';
import 'package:food_order/models/cusine_model.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_event.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenInitialEvent>(homeScreenInitialEvent);
    on<HomeScreenProductCartButtonClickedEvent>(
        homeScreenProductCartButtonClickedEvent);
    on<HomeScreenProductWishListButtonClickedEvent>(
        homeScreenProductWishListButtonClickedEvent);
    on<HomeScreenCartButtonNavigationEvent>(
        homeScreenCartButtonNavigationEvent);
    on<HomeScreenWishListButtonNavigationEvent>(
        homeScreenWishListButtonNavigationEvent);
    on<HomeScreenProfileButtonNavigationEvent>(
        homeScreenProfileButtonNavigationEvent);
    on<HomeScreenHistoryButtonNavigationEvent>(
        homeScreenHistoryButtonNavigationEvent);
  }
  FutureOr<void> homeScreenInitialEvent(
      HomeScreenInitialEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeScreenLoadedState(CuisineData.cuisineData
        .map((cuisine) => CuisineModel(
            id: cuisine['id'],
            image: cuisine['image'],
            name: cuisine['name'],
            price: cuisine['price'],
            cuisineType: cuisine['cuisineType'],
            description: cuisine['description']))
        .toList()));
  }

  FutureOr<void> homeScreenProductCartButtonClickedEvent(
      HomeScreenProductCartButtonClickedEvent event,
      Emitter<HomeScreenState> emit) {
    if (!(cartItem.contains(event.clickedCuisine))) {
      //no duplicate item will be added
      cartItem.add(event.clickedCuisine);
      emit(HomeScreenCuisineAddedToCartActionState());
    }
  }

  FutureOr<void> homeScreenProductWishListButtonClickedEvent(
      HomeScreenProductWishListButtonClickedEvent event,
      Emitter<HomeScreenState> emit) {
    if (!(wishlistItem.contains(event.clickedCuisine))) {
      wishlistItem.add(event.clickedCuisine);
      emit(HomeScreenCuisineWishlistedActionState());
    }
  }

  FutureOr<void> homeScreenCartButtonNavigationEvent(
      HomeScreenCartButtonNavigationEvent event,
      Emitter<HomeScreenState> emit) {
    emit(HomeScreenNavigateToCartPageActionState());
  }

  FutureOr<void> homeScreenWishListButtonNavigationEvent(
      HomeScreenWishListButtonNavigationEvent event,
      Emitter<HomeScreenState> emit) {
    emit(HomeScreenNavigateToWishListPageActionState());
  }

  FutureOr<void> homeScreenProfileButtonNavigationEvent(
      HomeScreenProfileButtonNavigationEvent event,
      Emitter<HomeScreenState> emit) {
    emit(HomeScreenNavigateToProfilePageActionState());
  }

  FutureOr<void> homeScreenHistoryButtonNavigationEvent(
      HomeScreenHistoryButtonNavigationEvent event,
      Emitter<HomeScreenState> emit) {
    emit(HomeScreenNavigateToHistoryPageActionState());
  }
}
