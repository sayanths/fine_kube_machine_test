import 'package:fine_kube_machine_test/add_page/view/add_page.dart';
import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:fine_kube_machine_test/core/widgets/widgets.dart';
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddPage()));
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
              color: yellow,
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

class CustomBottomNavImageContainer extends StatelessWidget {
  final String image;
  final String title;
  const CustomBottomNavImageContainer({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 15,
        ),
        height10,
        Text(title),
      ],
    );
  }
}
