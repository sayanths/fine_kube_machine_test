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
            const CaruselSliderContainerCustom(),
            const CustomAppBar(),
            const SliverColorCustom(),
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

class SliverColorCustom extends StatelessWidget {
  const SliverColorCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
      child: ColoredBox(
        color: Colors.blue,
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class CaruselSliderContainerCustom extends StatelessWidget {
  const CaruselSliderContainerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
     
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
              Column(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            Flexible(
                              child: const Text(
                                "sdsd",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/bottom_left_arrow.png",
                              height: 60,
                              color: Colors.white.withOpacity(0.2),
                            )),
                      ],
                    ),
                  ),
                  const Flexible(
                    child: Text("ds"),
                  ),
                  const Flexible(
                    child: Text("ds"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
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
