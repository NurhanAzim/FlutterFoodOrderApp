import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/config/constants.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:food_order/features/home_screen/ui/cuisine_detail_view.dart';
import 'package:food_order/models/cusine_model.dart';
import 'package:food_order/features/cart/bloc/cart_bloc.dart';
import 'package:food_order/features/cart/bloc/cart_event.dart';

class CartTileWidget extends StatelessWidget {
  final CuisineModel cuisineModel;
  final CartBloc cartBloc;
  final HomeScreenBloc homeBloc;
  const CartTileWidget(
      {super.key,
      required this.cuisineModel,
      required this.cartBloc,
      required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cuisineModel),
      onDismissed: (direction) {
        cartBloc.add(CartRemoveFromCartEvent(cuisineModel));
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CuisineDetailView(
                    cuisineModel: cuisineModel, homeBloc: homeBloc))),
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          height: 100,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        '${baseBackgroundImageURL(dotenv.env['SUPABASE_PROJECT_ID']!)}/${cuisineModel.image}',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      height: AppLayout.getHeight(140),
                      width: AppLayout.getWidth(140),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: imageProvider),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cuisineModel.name,
                          style: Styles.headlineStyle3
                              .copyWith(color: Colors.black)),
                      Text(
                        cuisineModel.price,
                        style: Styles.headlineStyle3,
                      ),
                    ],
                  ))
                ],
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  height: 20,
                  width: 103,
                  child: Container(
                    width: double.minPositive,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Styles.redColor),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.minimize_rounded),
                          iconSize: 12,
                          color: Colors.white,
                        ),
                        Text(
                          cuisineModel
                              .id, //TODO: change to cart item quantity later
                          style: Styles.textStyle.copyWith(color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          iconSize: 12,
                          color: Colors.white,
                        )
                      ], //TODO: how much in cart
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
