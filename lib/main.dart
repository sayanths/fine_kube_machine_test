import 'package:fine_kube_machine_test/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation/view_model/bottom_nav_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationController>(
            create: (context) => BottomNavigationController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fine kube',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
