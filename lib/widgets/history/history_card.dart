import 'package:flutter/material.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/data/history_data.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.data}) : super(key: key);
  final HistoryCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(
          height: MediaQuery.of(context).size.height * 0.1),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: ColorsData.backgroundSecondPrimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: [
                    TextSpan(
                        text: data.isCompressed ? 'COMPRESSED' : 'DECOMPRESSED',
                        style: const TextStyle(
                            color: ColorsData.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\n' + data.fileName,
                        style: const TextStyle(
                            color: ColorsData.textAdditional,
                            fontWeight: FontWeight.bold)),
                  ])),
            ),
            Expanded(
              child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(children: [
                    TextSpan(
                        text: data.percentage.toStringAsFixed(1) + '%',
                        style: const TextStyle(
                            color: ColorsData.textGold,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\n' + data.mbSize.toStringAsFixed(2) + ' MB',
                        style: const TextStyle(
                            color: ColorsData.textAdditional,
                            fontWeight: FontWeight.bold)),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
