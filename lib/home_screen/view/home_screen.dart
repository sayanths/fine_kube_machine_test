import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        width: size.width,
        child:  CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                
                
               // title: Text('app bar'),
                background: Container(
                  color: orange,
                ),
                stretchModes: <StretchMode>[
                  StretchMode.blurBackground,
                  
                ],

              ),
              // onStretchTrigger: (() {
              
              // }), 
            ),
            SliverToBoxAdapter(
          child: Container(
            height: size.height,
            width: 300,
            color: blue,
          )
            )
          ],
        ),
      ),
    );
  }
}
