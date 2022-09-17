import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:fine_kube_machine_test/core/widgets/widgets.dart';
import 'package:fine_kube_machine_test/home_screen/model/person_model.dart';
import 'package:fine_kube_machine_test/home_screen/view/widgets/apbar_widgets/appbar_widget.dart';
import 'package:fine_kube_machine_test/home_screen/view/widgets/sliver_custom.dart';
import 'package:fine_kube_machine_test/home_screen/view_model/home_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeScreenController>().personDataList;

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
                floating: true,
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
                        height: size.height / 7,
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
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "see All",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 35,
                      ),
                      Expanded(
                          child: Consumer<HomeScreenController>(
                        builder: (context, value, _) => FutureBuilder(
                          future: value.fetchUserData(),
                          builder: (context,
                              AsyncSnapshot<List<ModelClass>> snapshot) {
                            return snapshot.hasData
                                ? LimitedBox(
                                    maxHeight: size.height,
                                    child: RefreshIndicator(
                                      onRefresh: value.refreshList,
                                      color: blue,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final data = snapshot.data?[index];
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
                                                        BorderRadius.circular(
                                                            6),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          data!.image
                                                              .toString(),
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                title: Text(data.name),
                                                subtitle: const Text(
                                                    "Until 20/03/2020",
                                                    style: greyTitle),
                                                trailing: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: const [
                                                    Text(
                                                      "\$100",
                                                      style:
                                                          TextStyle(color: red),
                                                    ),
                                                    Text(
                                                      "out of \$ 300",
                                                      style: greyTitle,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: value.personDataList.length,
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: CupertinoActivityIndicator(),
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
