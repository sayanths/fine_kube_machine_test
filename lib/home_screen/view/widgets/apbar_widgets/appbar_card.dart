import 'package:fine_kube_machine_test/core/colors/colors.dart';
import 'package:flutter/material.dart';

class AppBarCustomCard extends StatelessWidget {
  const AppBarCustomCard(
      {Key? key,
      required this.amountText,
      required this.iconUrl,
      required this.title,
      required this.cardColor})
      : super(key: key);
  final String amountText;
  final String iconUrl;
  final String title;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, right: 10),
      child: Container(
          decoration: BoxDecoration(
              color: cardColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Color.fromARGB(156, 255, 255, 255),
                              fontSize: 14),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        cardColor.withOpacity(0.5),
                                        BlendMode.dstATop),
                                    image: AssetImage(iconUrl))),
                          ),
                        )
                      ]),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          "\$ $amountText",
                          style: const TextStyle(
                              color: white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "2 debits",
                      style: TextStyle(color: white),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

