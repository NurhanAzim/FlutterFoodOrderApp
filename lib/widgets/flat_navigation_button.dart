import 'package:flutter/material.dart';
import 'package:food_order/common/app_styles.dart';

class FlatNavigationButton extends StatelessWidget {
  final String routeName;
  final String text;

  const FlatNavigationButton({
    super.key,
    required this.routeName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Styles.headlineStyle2.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
