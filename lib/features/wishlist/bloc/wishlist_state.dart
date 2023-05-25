import 'package:flutter/widgets.dart';
import 'package:food_order/models/cusine_model.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<CuisineModel> cuisineModel;

  WishlistSuccessState(this.cuisineModel);
}
