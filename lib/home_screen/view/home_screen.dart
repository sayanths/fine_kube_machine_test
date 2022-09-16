import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ColoredBox(
       color: yellow,
        // child: CustomScrollView(
        //   shrinkWrap: true,
        //   physics: const BouncingScrollPhysics(),
        //   slivers: [
        //     SliverAppBar(
        //       stretch: true,
        //       expandedHeight: 260,
        //       title: const Text("Home"),
        //       leading: const CircleAvatar(),
        //       actions: [
        //         Image.asset(
        //           "assets/notifications.png",
        //           height: 5,
        //         )
        //       ],
        //       centerTitle: true,
        //       flexibleSpace: FlexibleSpaceBar(
        //         background: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Container(
        //               margin: const EdgeInsets.only(top: 90),
        //               height: 180,
        //               width: 140,
        //               decoration: BoxDecoration(
        //                   color: orange,
        //                   borderRadius: BorderRadius.circular(20)),
        //             ),
        //           ],
        //         ),
        //         stretchModes: const <StretchMode>[
        //           StretchMode.blurBackground,
        //         ],
        //       ),
        //       // onStretchTrigger: (() {

        //       // }),
        //     ),
        //     SliverToBoxAdapter(
        //       child: Container(
        //         height: size.height,
        //         width: size.width,
        //         decoration: const BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(20),
        //             topRight: Radius.circular(20),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 200,
              ),
            ),
            SliverFillRemaining(
              
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    final appBarSize = expandedHeight - shrinkOffset;
   // final cardTopPosition = expandedHeight / 5 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
           // height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child:Container(
              color: yellow,
              
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top:250,
            bottom: -60.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
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
            ),
          ),
        ],
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
