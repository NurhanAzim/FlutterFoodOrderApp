import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order/common/cart_items.dart';
import 'package:food_order/features/cart/bloc/cart_event.dart';
import 'package:food_order/features/cart/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItem));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    if ((cartItem.contains(event.cuisineModel))) {
      cartItem.remove(event.cuisineModel);
    }
    emit(CartSuccessState(cartItem)); //refresh page
  }
}
