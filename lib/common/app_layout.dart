import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  // Get the screen size of the device
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // Get the height of the device screen
  static getScreenHeight() {
    return Get.height;
  }

  // Get the width of the device screen
  static getScreenWidth() {
    return Get.width;
  }

  // Get the height of an element in proportion to the screen height
  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  // Get the width of an element in proportion to the screen width
  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}
