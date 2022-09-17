import 'package:flutter/material.dart';

class CustomCircleAvatarForSliver extends StatelessWidget {
  const CustomCircleAvatarForSliver(
      {Key? key, required this.iconUrl, required this.title})
      : super(key: key);
  final String iconUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(118, 255, 255, 255),
            radius: 45,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              child: Image(
                width: 20,
                height: 20,
                image: AssetImage(
                  iconUrl,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
