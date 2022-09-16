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
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: const [
                            //     SizedBox(
                            //       height: 35,
                            //     ),
                            //     Padding(
                            //       padding: EdgeInsets.symmetric(horizontal: 25),
                            //       child: Text(
                            //         "sdsd",
                            //         style: TextStyle(color: Colors.black),
                            //       ),
                            //     ),
                            //   ],
                            // ),

                            Row(
                              children: [
                                const Text(
                                  "sdsd",
                                  style: TextStyle(color: Colors.black),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      //  alignment: Alignment.topRight,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    backgroundColor: yellow,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(Icons.notifications)
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
              bottom: -40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomCircleAvatar(),
                  CustomCircleAvatar(),
                  CustomCircleAvatar(),
                  CustomCircleAvatar(),
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

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withOpacity(0.5),
      radius: 50,
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black,
        // child: Icon(
        //   Icons.add,
        //   color: yellow,
        // ),
      ),
    );
  }
}
