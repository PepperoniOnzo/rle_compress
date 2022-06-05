import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/view/view_rle.dart';
import 'package:rle_compress/widgets/stats/act_but.dart';
import 'package:rle_compress/widgets/stats/right_info.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: context.watch<ViewRLE>().ready
            ? const ActionWidget()
            : const RightInfo());
  }
}
