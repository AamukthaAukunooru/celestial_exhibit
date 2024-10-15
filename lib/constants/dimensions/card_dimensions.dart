import 'package:flutter/material.dart';

class CardDimensions {
  static setScreenDimensions(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static late double screenWidth, screenHeight;
  static double width = screenWidth > 400 ? 300 : double.infinity;
  static double height = 350;
  static double imgHeight = 280;
}