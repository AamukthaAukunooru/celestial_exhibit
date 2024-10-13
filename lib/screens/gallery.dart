import 'package:celestial_exhibit/constants/dimensions/card_dimensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'card_layouts.dart';
import '../api_services.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();

    apiService.fetchApod(2024-10-13).then((value) {
      if (kDebugMode) {
        print(value['url']);
      }
    });

    // Sample data for demonstration
    final List<Map<String, String>> cardData = [
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Northern Lights, West Virginia',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Another description here',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Northern Lights, West Virginia',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Another description here',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Northern Lights, West Virginia',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Another description here',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Northern Lights, West Virginia',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Another description here',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Northern Lights, West Virginia',
      },
      {
        'imageUrl': 'https://apod.nasa.gov/apod/image/2410/241010_eggleston_1024.jpg',
        'title': 'Astronomy Picture of the Day',
        'description': 'Another description here',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          padding: const EdgeInsets.only(right: 30.0),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              buildCardLayout('2024-10-08'),
              buildCardLayout('2024-10-02'),
              buildCardLayout('2024-10-03'),
              buildCardLayout('2024-10-04'),
              buildCardLayout('2024-10-05'),
              buildCardLayout('2024-10-06'),
              buildCardLayout('2024-10-07'),
            ],
          )
        ),
      ),
    );
  }
}

  Widget buildCardLayout(String date) {
    ApiService apiService = ApiService();

    return FutureBuilder(
      future: apiService.fetchApod(date),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: CardDimensions.width,
            height: CardDimensions.height,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return const SizedBox(
            width: CardDimensions.width,
            height: CardDimensions.height,
            child: Center(child: Text('Error fetching data')),
          );
        } else if (snapshot.hasData) {
          final cardData = snapshot.data;
          return CardLayouts(
            imageUrl: cardData!['media_type'] == 'video'
                ? cardData['thumbnail_url']
                : cardData['hdurl'],
            title: cardData['title'],
          );
        }
        return const SizedBox.shrink(); // Fallback if nothing matches
      },
    );

}
