
import 'package:flutter/material.dart';
import 'custom_carousel/custom_carousel.dart';

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
