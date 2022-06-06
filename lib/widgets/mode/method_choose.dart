import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/view/view_rle.dart';
import 'package:rle_compress/widgets/widgets.dart';

class MethodChoose extends StatelessWidget {
  const MethodChoose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        onFlipDone: ((isFront) {
          context.read<ViewRLE>().changeCompress();
        }),
        direction: FlipDirection.VERTICAL,
        front: const CardTitle(title: 'COMPRESSION'),
        back: const CardTitle(title: 'DECOMPRESSION'));
  }
}
