import 'package:flutter/material.dart';
import 'package:food_order/models/cusine_model.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final CuisineModel cuisineModel;

  CartRemoveFromCartEvent(this.cuisineModel);
}
