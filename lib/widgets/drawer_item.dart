import 'package:flutter/material.dart';
import 'package:food_order/common/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: Styles.textStyle.copyWith(color: Colors.white)),
      onTap: onTap,
    );
  }
}
