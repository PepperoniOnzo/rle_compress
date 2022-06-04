import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/view/view_rle.dart';

class ActionWidget extends StatefulWidget {
  const ActionWidget({Key? key}) : super(key: key);

  @override
  State<ActionWidget> createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  bool presed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: presed
            ? FutureBuilder(
                future: context.read<ViewRLE>().RLE(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            ColorsData.textPrimary),
                      ),
                    );
                  }
                })
            : Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              presed = true;
                            });
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
                          child: Expanded(
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.05),
                              child: const Text(
                                'START RLE',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: TextButton(
                          onPressed: () {
                            context.read<ViewRLE>().changeDirectory();
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
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.05),
                              child: const Icon(Icons.settings))),
                    ),
                  ],
                ),
              ));
  }
}
