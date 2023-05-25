import 'package:flutter/material.dart';
import 'package:food_order/features/get_started_screen.dart';
import 'package:food_order/features/home_screen/ui/home_screen.dart';
import 'package:food_order/common/app_styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering',
      theme: ThemeData(
        primaryColor: primary,
      ),
      routes: {
        GetStartedScreen.routeName: (context) => const GetStartedScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: GetStartedScreen.routeName,
    );
  }
}
