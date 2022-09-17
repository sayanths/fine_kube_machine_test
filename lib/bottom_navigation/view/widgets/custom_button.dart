
import 'package:fine_kube_machine_test/routes/routes.dart';
import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routes.push(screen: screen)
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 15,
          height: 55,
          child: Container(
            margin: const EdgeInsets.only(right: 10, bottom: 5),
            height: size.height / 10,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
