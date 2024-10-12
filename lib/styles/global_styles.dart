import 'package:celestial_exhibit/styles/colors.dart';
import 'package:flutter/material.dart';

class GlobalStyles {
  static TextStyle baseTextStyle = const TextStyle(
    color: AppColors.text,
  );

  static TextStyle primaryText = GlobalStyles.baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle secondaryText = GlobalStyles.baseTextStyle.copyWith(
    fontSize: 16,
  );
}
