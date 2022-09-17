import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/appbar_icon.png")),
          Text(
            "Home",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: black,
            ),
          ),
          Icon(
            Icons.notifications,
            color: black,
          )
        ]);
  }
}
