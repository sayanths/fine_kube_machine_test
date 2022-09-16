import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: SizedBox(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(Icons.notifications)
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70, left: 15),
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                SizedBox(
                                  height: 35,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: Text(
                                    "sdsd",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    "assets/bottom_left_arrow.png",
                                    height: 60,
                                    color: Colors.black.withOpacity(0.2),
                                  )),
                            ),
                          ],
                        ),
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
              child: ColoredBox(
                color: Colors.blue,
                child: Column(
                  children: const [],
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 220,
              bottom: -60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    radius: 40,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}