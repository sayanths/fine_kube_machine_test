import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double? expandedHeight;

  const CustomSliverAppBarDelegate({
    @required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const size = 60;
    final top = expandedHeight! - shrinkOffset - size / 3;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        buildCarousel(shrinkOffset),
        Positioned(
          top: top - 5,
          left: 20,
          right: 20,
          child: buildOverlay(shrinkOffset),
        ),
      ],
    );
  }

  Widget buildCarousel(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: const CarouselWidget(),
      );
  Widget buildOverlay(double shrinkOffset) => SizedBox(
        child: Row(children: const [
          CustomCircleAvatarForSliver(
            iconUrl: "assets/plus.png",
            title: "NEW",
          ),
          CustomCircleAvatarForSliver(
            iconUrl: "assets/topright-arrow.png",
            title: "PAY OFF",
          ),
          CustomCircleAvatarForSliver(
            iconUrl: "assets/bottomleft_arrow.png",
            title: "LEND",
          ),
          CustomCircleAvatarForSliver(
            iconUrl: "assets/grid.png",
            title: "MORE",
          )
        ]),
      );

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight!;
  double disappear(double shrinkOffset) =>
      1 - shrinkOffset / expandedHeight! - 0.1;

  @override
  double get maxExtent => expandedHeight!;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class CustomCircleAvatarForSliver extends StatelessWidget {
  const CustomCircleAvatarForSliver(
      {Key? key, required this.iconUrl, required this.title})
      : super(key: key);
  final String iconUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(118, 255, 255, 255),
          radius: 45,
          child: CircleAvatar(
            radius: 34,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            child: Image(
              width: 20,
              height: 20,
              image: AssetImage(
                iconUrl,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

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

class AppBarCustomCard extends StatelessWidget {
  const AppBarCustomCard(
      {Key? key,
      required this.amountText,
      required this.iconUrl,
      required this.title,
      required this.cardColor})
      : super(key: key);
  final String amountText;
  final String iconUrl;
  final String title;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, right: 10),
      child: Container(
          decoration: BoxDecoration(
              color: cardColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Color.fromARGB(156, 255, 255, 255),
                              fontSize: 14),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        cardColor.withOpacity(0.5),
                                        BlendMode.dstATop),
                                    image: AssetImage(iconUrl))),
                          ),
                        )
                      ]),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          "\$ $amountText",
                          style: const TextStyle(
                              color: white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "2 debits",
                      style: TextStyle(color: white),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

