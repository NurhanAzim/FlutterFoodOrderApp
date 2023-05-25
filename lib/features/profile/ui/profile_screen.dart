import 'package:flutter/material.dart';
import 'package:food_order/features/profile/ui/profile_isloggedon.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileIsLoggedOn();
    // Scaffold(
    //   backgroundColor: Styles.bgColor,
    //   appBar: AppBar(
    //     backgroundColor: Styles.bgColor,
    //     elevation: 0,
    //     title: Text(
    //       'My Profile',
    //       style: Styles.headlineStyle3.copyWith(color: Colors.black),
    //     ),
    //     centerTitle: true,
    //     leading: IconButton(
    //       icon: const Icon(Icons.chevron_left_rounded),
    //       onPressed: () =>
    //           Navigator.popUntil(context, ModalRoute.withName('/')),
    //       color: Colors.black,
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: const [
    //           Icon(
    //             Icons.co_present_outlined,
    //             color: Colors.grey,
    //             size: 80,
    //           ),
    //           Gap(10),
    //           Text('You have not log in yet'),
    //           Text('Please log in to continue'),
    //         ],
    //       ),
    //     ),
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //       child: actionButton(
    //           Styles.redColor, Colors.white, () {}, 'Log In Here')),
    // );
  }
}
