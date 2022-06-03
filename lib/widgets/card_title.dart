import 'package:flutter/material.dart';

import '../data/colors.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        color: ColorsData.backgroundAdditional,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(clipBehavior: Clip.antiAlias, children: [
          Align(
            alignment: const Alignment(2.0, -2.0),
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(45 / 360),
              child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 125,
                    maxWidth: 250,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsData.backgroundAdditional,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(1.5, 2.0),
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(45 / 360),
              child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 100,
                    maxWidth: 200,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsData.backgroundAdditional,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select a mode",
                  style: TextStyle(
                      color: ColorsData.textAdditional,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: ColorsData.textPrimary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
