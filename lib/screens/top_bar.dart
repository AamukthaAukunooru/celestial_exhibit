import 'package:celestial_exhibit/screens/gallery.dart';
import 'package:celestial_exhibit/screens/home.dart';
import 'package:celestial_exhibit/styles/colors.dart';
import 'package:flutter/material.dart';

class SideTabBar extends StatefulWidget {
  const SideTabBar({super.key});

  @override
  SideTabBarState createState() => SideTabBarState();
}

class SideTabBarState extends State<SideTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _fetchTabItems().length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Celestial Exhibit'),
        backgroundColor: AppColors.sideTabBg,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Container(
            color: AppColors.sideTabBg,
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              indicatorColor: const Color(0xFF6750A4),

              unselectedLabelColor: AppColors.text,
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w100),

              dividerColor: Colors.transparent,


              tabs: _fetchTabItems().map((item) => Tab(
                icon: item['icon'],
                text: item['label'].data,
              )).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _fetchTabItems().map<Widget>((item) => item['builder']()).toList(),
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
        'builder': () => const Gallery(),
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