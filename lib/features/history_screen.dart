import 'package:flutter/material.dart';
import 'package:food_order/common/app_styles.dart';
import 'package:gap/gap.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = '/history';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () =>
              Navigator.popUntil(context, ModalRoute.withName('/')),
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        // color: Styles.bgColor,
        padding: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.event_note_outlined,
                size: 80,
                color: Colors.grey.shade400,
              ),
              const Gap(8),
              Text(
                'No history yet',
                style: Styles.headlineStyle2
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const Gap(8),
              Text('Hit the orange button down \nbelow to Create an order',
                  style: Styles.textStyle)
            ],
          ),
        ),
      ),
    );
  }
}
