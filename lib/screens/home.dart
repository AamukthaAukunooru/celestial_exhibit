import 'package:celestial_exhibit/constants/strings/global_strings.dart';
import 'package:celestial_exhibit/styles/global_styles.dart';
import 'package:flutter/material.dart';
import '../constants/strings/home_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /*
      Featured
      Today's Sky
      Upcoming Astronomical Events
      Highlights
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            

            Image.asset(
              'assets/images/apod.jpg',
              width: 200,
            ),

            const SizedBox(height: 20),
            Text(
              GlobalStrings.appTitle,
              textAlign: TextAlign.center,
              style: GlobalStyles.primaryText,
            ),

            const SizedBox(height: 20),
            Text(
              HomeStrings.homeDescription,
              textAlign: TextAlign.center,
              style: GlobalStyles.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
