import 'package:flutter/material.dart';
import 'package:food_order/config/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/widgets/action_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GetStartedScreen extends StatelessWidget {
  static const String routeName = '/getStarted';
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
        body: Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              '${baseBackgroundImageURL(dotenv.env['SUPABASE_PROJECT_ID']!)}/get_started_image.png',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
          alignment: Alignment.bottomCenter,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 25,
            left: size.width / 3.6,
            child: actionButton(
              Colors.white,
              Styles.primaryColor,
              () => Navigator.pushReplacementNamed(context, '/'),
              'Get Started',
            )),
      ],
    ));
  }
}
