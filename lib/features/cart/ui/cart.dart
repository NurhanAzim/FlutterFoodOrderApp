import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/common/cart_items.dart';
import 'package:food_order/features/cart/bloc/cart_bloc.dart';
import 'package:food_order/features/cart/bloc/cart_event.dart';
import 'package:food_order/features/cart/bloc/cart_state.dart';
import 'package:food_order/features/cart/ui/cart_tile_widget.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:gap/gap.dart';

class Cart extends StatefulWidget {
  final HomeScreenBloc homeBloc;
  const Cart({super.key, required this.homeBloc});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        elevation: 0,
        backgroundColor: Styles.bgColor,
        foregroundColor: Colors.black,
      ),
      body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, listener) {},
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final successState = state as CartSuccessState;
                if (cartItem.isEmpty) {
                  return Container(
                    color: Styles.bgColor,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const Gap(8),
                          Text(
                            'Cart is empty',
                            style: Styles.headlineStyle2.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const Gap(8),
                          Text(
                              'Hit the orange button down \nbelow to browse for item',
                              style: Styles.textStyle)
                        ],
                      ),
                    ),
                  );
                }
                return Container(
                  color: Styles.bgColor,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: AppLayout.getWidth(50),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.swipe_outlined),
                            Text('swipe on an item to delete')
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: successState.cartItems.length,
                          itemBuilder: (context, index) {
                            return CartTileWidget(
                              cuisineModel: successState.cartItems[index],
                              cartBloc: cartBloc,
                              homeBloc: widget.homeBloc,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              default:
                return const Scaffold();
            }
          }),
    );
  }
}
