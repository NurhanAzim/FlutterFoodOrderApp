import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:food_order/features/home_screen/bloc/home_screen_event.dart';

class HomeBottomNavBar extends StatefulWidget {
  final HomeScreenBloc homeBloc;
  const HomeBottomNavBar({Key? key, required this.homeBloc}) : super(key: key);

  @override
  _HomeBottomNavBarState createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
        // Navigate to the corresponding page when a bottom navigation bar item is tapped
        switch (index) {
          case 0:
            Navigator.popUntil(context, ModalRoute.withName('/'));
            break;
          case 1:
            return widget.homeBloc
                .add(HomeScreenWishListButtonNavigationEvent());
          case 2:
            return widget.homeBloc
                .add(HomeScreenProfileButtonNavigationEvent());
          case 3:
            return widget.homeBloc
                .add(HomeScreenHistoryButtonNavigationEvent());
          default:
            Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Styles.bgColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Styles.redColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
          activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentSystemIcons.ic_fluent_heart_regular),
          activeIcon: Icon(FluentSystemIcons.ic_fluent_heart_filled),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
          activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(FluentSystemIcons.ic_fluent_history_regular),
          activeIcon: Icon(FluentSystemIcons.ic_fluent_history_filled),
          label: 'Recent',
        ),
      ],
    );
  }
}
