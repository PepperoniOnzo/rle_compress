import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/view/view_rle.dart';
import 'package:rle_compress/widgets/stats/alert_dialog.dart';

class ActionWidget extends StatefulWidget {
  const ActionWidget({Key? key}) : super(key: key);

  @override
  State<ActionWidget> createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  final myController = TextEditingController();
  bool presed = false;
  late Future<void> future;
  String dropValue = 'BMP';

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: presed
            ? FutureBuilder(
                future: future,
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
                margin: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              future = context.read<ViewRLE>().RLE();
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
                      margin: const EdgeInsets.only(left: 10),
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
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: DropdownButton<String>(
                        style: const TextStyle(
                            color: ColorsData.textPrimary, fontSize: 20),
                        dropdownColor: ColorsData.backgroundSecondPrimary,
                        onChanged: (value) {
                          setState(() {
                            if (value != 'OWN') {
                              dropValue = value!;
                              context
                                  .read<ViewRLE>()
                                  .setOutFileExtension(value);
                              return;
                            }
                            showAlertDialog(context, myController);
                            if (myController.text != '' &&
                                !myController.text
                                    .contains(RegExp(r'[^a-zA-Z]'))) {
                              dropValue = 'OWN';
                            }
                          });
                        },
                        value: dropValue,
                        items: <String>['BMP', 'PNG', 'JPG', 'GIF', 'OWN']
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ));
  }
}
