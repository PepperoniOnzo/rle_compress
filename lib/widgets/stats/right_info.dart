import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';

import '../../view/view_rle.dart';

class RightInfo extends StatelessWidget {
  const RightInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.42,
                maxWidth: MediaQuery.of(context).size.width * 0.42
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.read<ViewRLE>().percent.toStringAsFixed(1) + ' %',
                        maxLines: 1,

                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ColorsData.textGold)),
                        
                const Text(
                  'Compression percent',
                  style: TextStyle(
                      color: ColorsData.backgroundAdditional,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          VerticalDivider(
            color: ColorsData.textPrimary,
            thickness: 1,
            endIndent: MediaQuery.of(context).size.height * 0.05,
            indent: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.42,
                maxWidth: MediaQuery.of(context).size.width * 0.42
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    (context.read<ViewRLE>().sizeMbBefore -
                            context.read<ViewRLE>().sizeMbAfter)
                        .toStringAsFixed(2),
                        maxLines: 1,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ColorsData.textGold)),
                const Text(
                  'Compression in MB',
                  style: TextStyle(
                      color: ColorsData.backgroundAdditional,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
