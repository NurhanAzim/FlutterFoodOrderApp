import 'package:flutter/widgets.dart';
import 'package:food_order/models/cusine_model.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final CuisineModel cuisineModel;

  WishlistRemoveFromWishlistEvent(this.cuisineModel);
}
