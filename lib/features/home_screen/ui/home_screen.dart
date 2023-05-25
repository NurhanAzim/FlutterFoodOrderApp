// ignore_for_file: unnecessary_const

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order/features/history_screen.dart';
import 'package:food_order/features/home_screen/ui/cuisine_scroll_view.dart';
import 'package:food_order/common/app_layout.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_event.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_state.dart';
import 'package:food_order/features/cart/ui/cart.dart';
import 'package:food_order/features/profile/ui/profile_screen.dart';
import 'package:food_order/features/wishlist/ui/wishlist.dart';
import 'package:food_order/widgets/drawer_item.dart';
import 'package:food_order/widgets/home_bottom_nav_bar.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> tabs = ['Foods', 'Drinks', 'Snacks', 'Desserts'];

  @override
  void initState() {
    homeBloc.add(HomeScreenInitialEvent());
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final HomeScreenBloc homeBloc = HomeScreenBloc();
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeScreenActionState,
      buildWhen: (previous, current) => current is! HomeScreenActionState,
      listener: (context, state) {
        if (state is HomeScreenNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Cart(
                        homeBloc: homeBloc,
                      ))));
        } else if (state is HomeScreenNavigateToWishListPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FavoriteScreen(homeBloc: homeBloc)));
        } else if (state is HomeScreenNavigateToProfilePageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        } else if (state is HomeScreenNavigateToHistoryPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()));
        } else if (state is HomeScreenCuisineWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cuisine wishlisted!')));
        } else if (state is HomeScreenCuisineAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cuisine added to cart!')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeScreenLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeScreenLoadedState:
            final successState = state as HomeScreenLoadedState;
            return Scaffold(
              backgroundColor: Styles.bgColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: IconButton(
                      onPressed: () =>
                          // Navigator.pushNamed(context, '/ShoppingCart')
                          homeBloc.add(HomeScreenCartButtonNavigationEvent()),
                      icon: const Icon(Icons.shopping_cart_outlined),
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              drawer: Drawer(
                width: size.width * 0.8,
                backgroundColor: Styles.redColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: ListView(
                  padding: const EdgeInsets.only(top: 50),
                  children: [
                    DrawerItem(
                      icon: FluentSystemIcons.ic_fluent_people_regular,
                      text: 'Profile',
                      onTap: () => homeBloc
                          .add(HomeScreenProfileButtonNavigationEvent()),
                    ),
                    DrawerItem(
                      icon: Icons.shopping_cart_checkout_rounded,
                      text: 'Orders',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/order');
                      },
                    ),
                    DrawerItem(
                      icon: Icons.local_offer_outlined,
                      text: 'Offer and Promo',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/offerPromo');
                      },
                    ),
                    DrawerItem(
                      icon: Icons.feed_outlined,
                      text: 'Privacy Policy',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/privacyPolicy');
                      },
                    ),
                    DrawerItem(
                      icon: Icons.shield_outlined,
                      text: 'Security',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/security');
                      },
                    ),
                  ],
                ),
              ),
              body: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Delicious \nfood for you",
                      style: Styles.headlineStyle2,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Search Bar
                  Container(
                    width: double.infinity,
                    height: size.height * 0.05,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFefeeee),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      style: Styles.textStyle.copyWith(color: Colors.black45),
                      cursorColor: Colors.black45,
                      decoration: InputDecoration(
                        icon: const Icon(
                          FluentSystemIcons.ic_fluent_search_regular,
                          color: Colors.black87,
                        ),
                        hintText: 'Search',
                        hintStyle:
                            Styles.textStyle.copyWith(color: Colors.black45),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(bottom: 11),
                      ),
                    ),
                  ),
                  const Gap(15),
                  const Gap(100),
                  SizedBox(
                    height: size.height * 0.378,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: successState.cuisines.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                            CuisineScrollView(
                                homeBloc: homeBloc,
                                cuisineModel: successState.cuisines[index])
                          ]),
                        );
                      },
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: HomeBottomNavBar(
                homeBloc: homeBloc,
              ),
            );
          case HomeScreenErrorState:
            return const Scaffold(body: Center(child: Text('error')));

          default:
            return const Scaffold();
        }
      },
    );
  }
}
