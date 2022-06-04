import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/view/view_rle.dart';

class ErrorTab extends StatelessWidget {
  const ErrorTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.2,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: context.watch<ViewRLE>().error
              ? Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: ColorsData.textPrimary,
                        thickness: 1,
                        endIndent: 25,
                        indent: 25,
                      ),
                    ),
                    Text(
                      context.watch<ViewRLE>().errorStr,
                      style: const TextStyle(
                        color: ColorsData.textPrimary,
                        fontSize: 15,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: ColorsData.textPrimary,
                        thickness: 1,
                        endIndent: 25,
                        indent: 25,
                      ),
                    ),
                  ],
                )
              : const Divider(
                  color: ColorsData.textPrimary,
                  thickness: 1,
                  endIndent: 25,
                  indent: 25,
                ),
        ));
  }
}
