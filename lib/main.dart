import 'package:celestial_exhibit/constants/dimensions/card_dimensions.dart';
import 'package:flutter/material.dart';
import 'screens/top_bar.dart';
import 'styles/colors.dart';
import 'constants/strings/global_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CardDimensions.setScreenDimensions(context);

    return MaterialApp(
      title: GlobalStrings.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryBg
      ),
      home: const SideTabBar(),
    );
  }
}
