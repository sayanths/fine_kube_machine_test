import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: ColoredBox(
        color: blue,
        child: CustomScrollView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              
              stretch: true,
              expandedHeight: 200,
              title: Text("Home"),
              leading: CircleAvatar(),
              actions: [
                Image.asset("assets/notifications.png",height: 5,)
              ],
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
              
                background: Container(
                  color: blue,
                ),
                stretchModes: const <StretchMode>[
                  StretchMode.blurBackground,
                ],
              ),
              // onStretchTrigger: (() {
      
              // }),
            ),
            SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      
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
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
