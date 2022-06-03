import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/view/view_rle.dart';

class FileChoose extends StatelessWidget {
  const FileChoose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          25, MediaQuery.of(context).size.height * 0.02, 25, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Picked file",
                      style: TextStyle(
                        color: ColorsData.textAdditional,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        ' ' +
                            context.watch<ViewRLE>().sizeMbBefore.toStringAsFixed(2) +
                            ' mb',
                        style: const TextStyle(
                            color: ColorsData.textGold, fontSize: 15))
                  ],
                ),
                Flexible(
                  child: Text(context.watch<ViewRLE>().pickedFile,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: ColorsData.textPrimary, fontSize: 20)),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                context.read<ViewRLE>().getFile();
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                elevation: 4.0,
                primary: ColorsData.backgroundSecondPrimary,
                onPrimary: ColorsData.textPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                child: const Text(
                  'Choose',
                  style: TextStyle(fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
