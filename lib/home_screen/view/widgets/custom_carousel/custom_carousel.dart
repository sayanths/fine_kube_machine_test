
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';

import '../apbar_widgets/appbar_card.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: CarouselSlider(
          items: const [
            AppBarCustomCard(
              cardColor: green,
              amountText: "1250",
              iconUrl: "assets/bottom_left_arrow.png",
              title: "Owe me",
            ),
            AppBarCustomCard(
              cardColor: orange,
              amountText: "1130",
              iconUrl: "assets/top_right_arrow.png",
              title: "I owe",
            ),
            AppBarCustomCard(
              cardColor: green,
              amountText: "2930",
              iconUrl: "assets/bottom_left_arrow.png",
              title: "I owe",
            ),
            AppBarCustomCard(
              cardColor: orange,
              amountText: "2930",
              iconUrl: "assets/top_right_arrow.png",
              title: "I owe",
            )
          ],
          options: CarouselOptions(
              enableInfiniteScroll: false,
              padEnds: false,
              initialPage: 0,
              height: 220,
              disableCenter: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.42,
              autoPlay: false)),
    );
  }
}

