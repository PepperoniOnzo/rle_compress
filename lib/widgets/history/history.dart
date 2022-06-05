import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/data/history_data.dart';
import 'package:rle_compress/view/view_rle.dart';

import 'history_card.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<HistoryCardData> history = [];

  @override
  Widget build(BuildContext context) {
    history = context.watch<ViewRLE>().history;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: history.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: history.length,
              itemBuilder: (context, index) {
                return HistoryCard(
                  data: history[index],
                );
              },
            )
          : const Center(
              child: Text('NO HISTORY YET',
                  style: TextStyle(
                    fontSize: 25,
                    color: ColorsData.textPrimary,
                    fontWeight: FontWeight.bold,
                  )),
            ),
    );
  }
}
