import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:food_order/features/order/make_order_screen.dart';
import 'package:food_order/common/app_styles.dart';

class ActionBottomNavBar extends StatefulWidget {
  final Map<String, dynamic> cuisine;
  const ActionBottomNavBar({super.key, required this.cuisine});

  @override
  State<ActionBottomNavBar> createState() => _ActionBottomNavBarState();
}

class _ActionBottomNavBarState extends State<ActionBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
        if (index == 0) {
          // TODO: add to cart function
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MakeOrderScreen(food: widget.cuisine)));
        } else if (index == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MakeOrderScreen(food: widget.cuisine)));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Styles.primaryColor,
      currentIndex: 1,
      onTap: _onItemTapped,
      selectedItemColor: Colors.white,
      iconSize: 25,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded), label: 'Add to cart'),
        BottomNavigationBarItem(
          icon: Icon(FluentSystemIcons.ic_fluent_arrow_right_filled),
          label: 'Buy now',
        ),
      ],
    );
  }
}
