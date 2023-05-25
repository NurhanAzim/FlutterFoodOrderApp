import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/wishlist_item.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:food_order/models/cusine_model.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:food_order/features/wishlist/bloc/wishlist_event.dart';
import 'package:food_order/features/wishlist/bloc/wishlist_state.dart';
import 'package:food_order/features/wishlist/ui/wishlist_tile.dart';
import 'package:gap/gap.dart';

class FavoriteScreen extends StatefulWidget {
  final HomeScreenBloc homeBloc;
  const FavoriteScreen({super.key, required this.homeBloc});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    // TODO favorite cuisine
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () =>
              Navigator.popUntil(context, ModalRoute.withName('/')),
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        elevation: 0,
        backgroundColor: Styles.bgColor,
        foregroundColor: Colors.black,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listener: (context, listener) {},
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                if (wishlistItem.isEmpty) {
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
                            Icons.event_note_outlined,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const Gap(8),
                          Text(
                            'No favorite yet',
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
                            itemCount: successState.cuisineModel.length,
                            itemBuilder: (context, index) {
                              CuisineModel cuisine =
                                  successState.cuisineModel[index];
                              return WIshlistTile(
                                  wishlistBloc: wishlistBloc,
                                  cuisineModel: cuisine,
                                  homeBloc: widget.homeBloc);
                            }),
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
