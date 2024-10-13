import 'package:flutter/material.dart';
import '../constants/dimensions/card_dimensions.dart';
import '../styles/global_styles.dart';

class CardLayouts extends StatelessWidget {
  String imageUrl;
  String title;
  String header;

  CardLayouts({
    super.key,
    required this.imageUrl,
    required this.title,
    this.header = 'Astronomy Picture of the Day',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CardDimensions.width,
      height: CardDimensions.height,
      //margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
      decoration: BoxDecoration(
        color: const Color(0x3F100F15),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F100F15),
            blurRadius: 10.0,
            offset: Offset(0, 4),
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: CardDimensions.width,
              height: CardDimensions.imgHeight,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image is fully loaded, return the child
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return const Center(child: Icon(Icons.error)); // Show an error icon if the image fails to load
                },
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            header,
            textAlign: TextAlign.center,
            style: GlobalStyles.primaryText,
          ),
          const SizedBox(height: 4.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GlobalStyles.secondaryText,
          ),
        ],
      ),
    );
  }
}
