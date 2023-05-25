import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order/common/wishlist_item.dart';
import 'package:food_order/features/wishlist/bloc/wishlist_event.dart';
import 'package:food_order/features/wishlist/bloc/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItem));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    if (wishlistItem.contains(event.cuisineModel)) {
      wishlistItem.remove(event.cuisineModel);
    }
    emit(WishlistSuccessState(wishlistItem));
  }
}
