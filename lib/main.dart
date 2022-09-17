import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation/view/bottom_navigation.dart';
import 'bottom_navigation/view_model/bottom_nav_controller.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationController>(
          create: (context) => BottomNavigationController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fine kube',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BottomNavigationBarSCreen(),
      ),
    );
  }
}
