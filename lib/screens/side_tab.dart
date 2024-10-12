import 'package:celestial_exhibit/screens/gallery.dart';
import 'package:celestial_exhibit/screens/home.dart';
import 'package:celestial_exhibit/styles/colors.dart';
import 'package:flutter/material.dart';

class SideTabBar extends StatefulWidget {
  const SideTabBar({super.key});

  @override
  SideTabBarState createState() => SideTabBarState();
}

class SideTabBarState extends State<SideTabBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // Left Side Navigation Rail
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.all,

            selectedLabelTextStyle: const TextStyle(color: AppColors.text),

            unselectedIconTheme: const IconThemeData(
              color: AppColors.text
            ),
            unselectedLabelTextStyle: const TextStyle(color: AppColors.text),
            backgroundColor: AppColors.sideTabBg,
            destinations: _fetchTabItems().map((item) => NavigationRailDestination(
              icon: item['icon'],
              label: item['label'],
            )).toList(),
          ),
          Expanded(
            child: _fetchTabItems()[_selectedIndex]['builder'](), // Call the builder function for the selected page
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _fetchTabItems() {
    return [
      {
        'icon': const Icon(Icons.home),
        'label': const Text('Home'),
        'builder': () => const HomePage(),
      },
      {
        'icon': const Icon(Icons.photo),
        'label': const Text('Gallery'),
        'builder': () => const Gallery()
      },
      {
        'icon': const Icon(Icons.language),
        'label': const Text('Planets'),
        'builder': () => const Center(child: Text('Planets Page')),
      },
      {
        'icon': const Icon(Icons.precision_manufacturing),
        'label': const Text('Rovers'),
        'builder': () => const Center(child: Text('Rovers Page')),
      },
      {
        'icon': const Icon(Icons.question_answer),
        'label': const Text('Quizzes'),
        'builder': () => const Center(child: Text('Quizzes Page')),
      },
      {
        'icon': const Icon(Icons.article),
        'label': const Text('News'),
        'builder': () => const Center(child: Text('Astronomy News Page')),
      },
    ];
  }
}