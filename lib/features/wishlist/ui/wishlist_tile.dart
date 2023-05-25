import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/config/constants.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:food_order/features/home_screen/ui/cuisine_detail_view.dart';
import 'package:food_order/models/cusine_model.dart';
import 'package:food_order/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:food_order/features/wishlist/bloc/wishlist_event.dart';

class WIshlistTile extends StatelessWidget {
  final CuisineModel cuisineModel;
  final WishlistBloc wishlistBloc;
  final HomeScreenBloc homeBloc;
  const WIshlistTile(
      {super.key,
      required this.wishlistBloc,
      required this.cuisineModel,
      required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cuisineModel),
      onDismissed: (direction) {
        wishlistBloc.add(WishlistRemoveFromWishlistEvent(cuisineModel));
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CuisineDetailView(
                    cuisineModel: cuisineModel,
                    homeBloc:
                        homeBloc))), //TODO: Figure how to assign homebloc when navigating to detail
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
            ],
          ),
        ),
      ),
    );
  }
}
