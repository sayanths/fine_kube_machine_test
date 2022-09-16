import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ColoredBox(
        color: Colors.blue,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: CustomSliverDelegate(
                expandedHeight: 200,
              ),
            ),
            SliverFillRemaining(
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("My debts"),
                          Text("see All"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: LimitedBox(
                        maxHeight: size.height,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          "https://png.pngtree.com/png-vector/20200522/ourlarge/pngtree-square-blue-abstract-gradient-business-border-png-image_2210970.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: const Text("data"),
                                  subtitle: const Text("ssdsd"),
                                  trailing: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("100"),
                                      Text("out of \$ 300")
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
