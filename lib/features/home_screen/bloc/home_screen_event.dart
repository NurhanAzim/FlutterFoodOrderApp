import 'package:flutter/material.dart';
import 'package:food_order/models/cusine_model.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeScreenInitialEvent extends HomeScreenEvent {}

class HomeScreenProductWishListButtonClickedEvent extends HomeScreenEvent {
  final CuisineModel clickedCuisine;

  HomeScreenProductWishListButtonClickedEvent(this.clickedCuisine);
}

class HomeScreenProductCartButtonClickedEvent extends HomeScreenEvent {
  final CuisineModel clickedCuisine;

  HomeScreenProductCartButtonClickedEvent(this.clickedCuisine);
}

// Navigation

class HomeScreenWishListButtonNavigationEvent extends HomeScreenEvent {}

class HomeScreenCartButtonNavigationEvent extends HomeScreenEvent {}

class HomeScreenProfileButtonNavigationEvent extends HomeScreenEvent {}

class HomeScreenHistoryButtonNavigationEvent extends HomeScreenEvent {}
