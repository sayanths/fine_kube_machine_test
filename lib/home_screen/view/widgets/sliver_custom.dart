
import 'package:flutter/material.dart';
import 'custom_carousel/custom_carousel.dart';
import 'custom_circle_avatar/custom_circle_avatar.dart';

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
          left: 10,
          right: 10,
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

