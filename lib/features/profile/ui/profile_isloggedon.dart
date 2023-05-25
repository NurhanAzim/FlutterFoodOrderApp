import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/config/constants.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/widgets/flat_navigation_button.dart';
import 'package:gap/gap.dart';

class ProfileIsLoggedOn extends StatelessWidget {
  const ProfileIsLoggedOn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'My profile',
                  style: Styles.headlineStyle1
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const Gap(30),
                Text(
                  'Personal details',
                  style: Styles.headlineStyle3.copyWith(color: Colors.black87),
                ),
                const Gap(15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 18, 10, 50),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${baseBackgroundImageURL(dotenv.env['SUPABASE_PROJECT_ID']!)}/pp.png',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: size.width * 0.9,
                            maxHeight: size.height * 0.2,
                          ),
                          child: Container(
                            width: 374,
                            height: 197,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Azim Nurhan',
                                    style: Styles.headlineStyle2.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  'azim.nurhan.ahmad@gmail.com',
                                  style: Styles.textStyle,
                                ),
                                const Gap(5),
                                Text(
                                  '+60123456789',
                                  style: Styles.textStyle,
                                ),
                                const Gap(5),
                                Text(
                                    'No. 20, Jalan Selangor, Tanjung Aru, 88100, Kota Kinabalu, Sabah',
                                    style: Styles.textStyle),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                ),
                const Gap(15),
                const FlatNavigationButton(
                  routeName: '/order',
                  text: 'Orders',
                ),
                const Gap(10),
                const FlatNavigationButton(
                    routeName: '/pendingReview', text: 'Pending reviews'),
                const Gap(10),
                const FlatNavigationButton(routeName: '/faq', text: 'FAQ'),
                const Gap(10),
                const FlatNavigationButton(routeName: '/help', text: 'Help'),
              ]),
            ],
          )),
    );
  }
}
