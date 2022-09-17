import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:fine_kube_machine_test/home_screen/view_model/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/apbar_widgets/appbar_widget.dart';
import '../widgets/sliver_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final res = context.read<HomeScreenController>().personDataList;
    print(res);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: blue,
      body: SafeArea(
        child: ColoredBox(
          color: blue,
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: CustomSliverAppBarDelegate(
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
                      SizedBox(
                        height: size.height / 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "My debts",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "see All",
                              style: TextStyle(color: grey),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Consumer<HomeScreenController>(
                        builder: (context, value, _) => StreamBuilder<HomeScreenController>(
                        stream: value.streamController.stream,
                          builder: (context, AsyncSnapshot snapshot) {
                            return LimitedBox(
                              maxHeight: size.height,
                              child: RefreshIndicator(
                                onRefresh: value.refreshList,
                                color: blue,
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Card(
                                          elevation: 0,
                                          child: ListTile(
                                            leading: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: yellow,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                      "https://png.pngtree.com/png-vector/20200522/ourlarge/pngtree-square-blue-abstract-gradient-business-border-png-image_2210970.jpg",
                                                    ),
                                                    fit: BoxFit.cover),
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
                                        ),
                                      );
                                    }),
                              ),
                            );
                          },
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
