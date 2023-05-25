import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/config/constants.dart';
import 'package:food_order/models/cusine_model.dart';
import 'package:food_order/features/home_screen/ui/cuisine_detail_view.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:gap/gap.dart';

class CuisineScrollView extends StatelessWidget {
  final CuisineModel cuisineModel;
  final HomeScreenBloc homeBloc;
  const CuisineScrollView(
      {super.key, required this.cuisineModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CuisineDetailView(
                homeBloc: homeBloc, cuisineModel: cuisineModel),
          ),
        );
      },
      child: SizedBox(
        width: size.width * 0.60,
        height: AppLayout.getHeight(300),
        child: Container(
          margin: EdgeInsets.only(right: AppLayout.getWidth(3)),
          child: Stack(
            // alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: AppLayout.getHeight(250),
                width: AppLayout.getWidth(210),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 15,
                      blurRadius: 2,
                    )
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      const Gap(90),
                      Text(
                        cuisineModel.name,
                        style:
                            Styles.headlineStyle3.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(10),
                      Text(
                        cuisineModel.price,
                        style: Styles.headlineStyle3,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: -AppLayout.getHeight(65),
                child: CachedNetworkImage(
                  imageUrl:
                      '${baseBackgroundImageURL(dotenv.env['SUPABASE_PROJECT_ID']!)}/${cuisineModel.image}',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
