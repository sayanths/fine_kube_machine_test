import 'package:fine_kube_machine_test/bottom_navigation/view_model/bottom_nav_controller.dart';
import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarSCreen extends StatelessWidget {
  const BottomNavigationBarSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controler = context.read<BottomNavigationController>();
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavigationController>(
        builder: (context, value, _) => Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: size.height / 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        value.changeIndex(index);
                        value.widgetListBottomNav[index];
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(microseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                              bottom: index == value.currentIndex
                                  ? 0
                                  : size.width / 80,
                              right: size.width / 12,
                              left: size.width / 12,
                            ),
                            width: size.width / 15,
                            height: index == value.currentIndex
                                ? size.height / 190
                                : 0,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            value.listOfIcons[index],
                            size: size.width * .076,
                            color: index == value.currentIndex
                                ? Colors.black
                                : grey,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 15,
                height: 50,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: size.height / 10,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: controler.widgetListBottomNav[controler.currentIndex],
    );
  }
}
