import 'package:celestial_exhibit/styles/colors.dart';
import 'package:flutter/material.dart';

class GlobalStyles {
  static TextStyle baseTextStyle = const TextStyle(
    color: AppColors.text,
  );

  static TextStyle primaryText = GlobalStyles.baseTextStyle.copyWith(
    fontSize: 16,
  );

  static TextStyle secondaryText = GlobalStyles.baseTextStyle.copyWith(
    fontSize: 12,
    color: const Color(0x7FFFFFFF)
  );
}
