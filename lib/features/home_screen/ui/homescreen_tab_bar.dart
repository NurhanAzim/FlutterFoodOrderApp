// import 'package:flutter/material.dart';
// import 'package:food_order/screens/cuisine_scroll_view.dart';
// import 'package:food_order/common/cuisine_data.dart';
// import 'package:food_order/common/app_layout.dart';
// import 'package:food_order/common/app_styles.dart';
// import 'package:gap/gap.dart';

// class HomescreenTabBar extends StatefulWidget {
//   const HomescreenTabBar({super.key});

//   @override
//   State<HomescreenTabBar> createState() => _HomescreenTabBarState();
// }

// class _HomescreenTabBarState extends State<HomescreenTabBar>
//     with TickerProviderStateMixin {
//   late final TabController _tabController;
//   final List<String> tabs = ['Foods', 'Drinks', 'Snacks', 'Desserts'];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: tabs.length, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = AppLayout.getSize(context);
//     return Column(
//       children: [
//         TabBar(
//           controller: _tabController,
//           padding: const EdgeInsets.only(left: 40),
//           labelColor: Styles.redColor,
//           isScrollable: true,
//           indicatorColor: Styles.redColor,
//           tabs: tabs.map((tab) => Tab(text: tab)).toList(),
//         ),
//         const Gap(100),
//         SizedBox(
//           height: size.height * 0.378,
//           child: TabBarView(
//             controller: _tabController,
//             children: [
//               // Food
//               _buildCuisineList(CuisineData.cuisineData, 'food'),
//               // Drinks
//               _buildCuisineList(CuisineData.cuisineData, 'drink'),
//               // Snacks
//               _buildCuisineList(CuisineData.cuisineData, 'snack'),
//               // Desserts
//               _buildCuisineList(CuisineData.cuisineData, 'dessert'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCuisineList(
//       List<Map<String, dynamic>> items, String cuisineType) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.only(left: 45),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: items
//             .where((food) => food['cuisineType'] == cuisineType)
//             .map((food) => CuisineScrollView(cuisine: food))
//             .toList(),
//       ),
//     );
//   }
// }
