import 'package:fine_kube_machine_test/bottom_navigation/view_model/bottom_nav_controller.dart';
import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarSCreen extends StatelessWidget {
  const BottomNavigationBarSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavigationController>(
        builder: (context, value, _) => Container(
          height: size.height / 10,
          color: const Color.fromARGB(255, 251, 251, 251),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: const EdgeInsets.all(2),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  value.changeIndex(index);
                },
                splashColor: const Color.fromARGB(0, 245, 242, 242),
                highlightColor: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom:
                            index == value.currentIndex ? 0 : size.width / 70,
                        right: size.width / 12,
                        left: size.width / 12,
                      ),
                      width: size.width / 15,
                      height:
                          index == value.currentIndex ? size.height / 190 : 0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      value.listOfIcons[index],
                      size: size.width * .076,
                      color: index == value.currentIndex ? Colors.black : grey,
                    ),
                  
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
