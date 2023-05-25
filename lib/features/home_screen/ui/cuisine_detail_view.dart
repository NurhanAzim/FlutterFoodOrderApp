import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/common/wishlist_item.dart';
import 'package:food_order/config/constants.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/models/cusine_model.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_event.dart';
import 'package:gap/gap.dart';

class CuisineDetailView extends StatefulWidget {
  final CuisineModel cuisineModel;
  final HomeScreenBloc homeBloc;

  const CuisineDetailView(
      {super.key, required this.cuisineModel, required this.homeBloc});

  @override
  State<CuisineDetailView> createState() => _CuisineDetailViewState();
}

class _CuisineDetailViewState extends State<CuisineDetailView> {
  bool _isFavorited = false;

  void toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: Styles.headlineStyle2,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.keyboard_arrow_left),
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                IconButton(
                    highlightColor: Styles.primaryColor,
                    onPressed: () => widget.homeBloc.add(
                        HomeScreenProductWishListButtonClickedEvent(
                            widget.cuisineModel)),
                    icon: (wishlistItem.contains(widget.cuisineModel))
                        ? const Icon(FluentSystemIcons.ic_fluent_heart_filled)
                        : const Icon(FluentSystemIcons.ic_fluent_heart_regular),
                    color: Colors.black),
                IconButton(
                  highlightColor: Styles.primaryColor,
                  onPressed: () => widget.homeBloc.add(
                      HomeScreenProductCartButtonClickedEvent(
                          widget.cuisineModel)),
                  icon: const Icon(Icons.shopping_cart_outlined),
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  '${baseBackgroundImageURL(dotenv.env['SUPABASE_PROJECT_ID']!)}/${widget.cuisineModel.image}',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Text(
              widget.cuisineModel.name,
              style: Styles.headlineStyle2,
              textAlign: TextAlign.center,
            ),
            const Gap(10),
            Text(
              widget.cuisineModel.price,
              style: Styles.headlineStyle2.copyWith(color: Styles.redColor),
            ),
            const Gap(25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Info',
                  style: Styles.headlineStyle3.copyWith(color: Colors.black),
                ),
                const Gap(5),
                Text(
                  'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                  style: Styles.textStyle,
                ),
                const Gap(25),
                Text(
                  'Return Policy',
                  style: Styles.headlineStyle3.copyWith(color: Colors.black),
                ),
                const Gap(5),
                Text(
                  "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                  style: Styles.textStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ActionBottomNavBar(cuisine: widget.cuisine),
    );
  }
}
