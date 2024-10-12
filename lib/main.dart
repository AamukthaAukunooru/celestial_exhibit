/* Packages */
import 'package:flutter/material.dart';

/* Screens */
import 'screens/home.dart';
import 'screens/side_tab.dart';

/* Styles */
import 'styles/colors.dart';

/* Constants */
import 'constants/strings/global_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: AppColors.primaryBg
      ),
      home: const SideTabBar(),
    );
  }
}
