import 'package:flutter/material.dart';
import 'package:food_order/models/cusine_model.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<CuisineModel> cartItems;

  CartSuccessState(this.cartItems);
}
