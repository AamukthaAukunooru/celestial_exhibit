// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constants/dimensions/card_dimensions.dart';
import '../styles/global_styles.dart';
import 'skeleton_glow.dart';

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
      child:  Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: CardDimensions.width,
              height: CardDimensions.imgHeight,
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image is fully loaded, return the child
                  }
                  return renderImgSkeleton(context, loadingProgress);
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

  static Widget renderSkeleton() {

    Widget imgWidget = getImgSkeleton();

    Widget headerWidget = SkeletonGlow(
      backgroundColor: const Color(0x3F100F15),
      glowColor: const Color(0x1F100F15),
      glowHeight: 16,
      glowMargin: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        width: CardDimensions.width,
        height: 16,
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          color: const Color(0x3F100F15),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    Widget titleWidget = SkeletonGlow(
      backgroundColor: const Color(0x3F100F15),
      glowColor: const Color(0x1F100F15),
      glowHeight: 12,
      glowMargin: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        width: CardDimensions.width,
        height: 12,
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          color: const Color(0x3F100F15),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Container(
      width: CardDimensions.width,
      height: CardDimensions.height,
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
          imgWidget,
          const SizedBox(height: 8.0),
          headerWidget,
          const SizedBox(height: 4.0),
          titleWidget,
        ],
      ),
    );
  }

  static Widget getImgSkeleton({applyMargin = true, height}) {
    return SkeletonGlow(
      backgroundColor: const Color(0x3F100F15),
      glowColor: const Color(0x1F100F15),
      glowHeight: height ?? CardDimensions.imgHeight,
      glowMargin: applyMargin ? const EdgeInsets.only(left: 12, right: 12, top: 12) : EdgeInsets.zero,
      child: Container(
        margin: applyMargin ? const EdgeInsets.only(left: 12, right: 12, top: 12) : EdgeInsets.zero,
        height: height ?? CardDimensions.imgHeight,
        decoration: BoxDecoration(
          color: const Color(0x3F100F15),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget renderImgSkeleton(context, loadingProgress) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, // Align to the bottom
      children: [
        //Expanded(child: Container()), // This takes up the available space above
        getImgSkeleton(applyMargin: false, height: CardDimensions.imgHeight - 16), // Reduce the height by 16 to account for the progress bar
        Container(
          width: MediaQuery.of(context).size.width * 0.9, // Set desired width
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Optional padding for aesthetics
          child: LinearProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                : null,
            backgroundColor: const Color(0x3F100F15), // Set background color
            valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(31, 248, 248, 249)), // Set progress color
          ),
        ),
      ],
    );
  }

}
