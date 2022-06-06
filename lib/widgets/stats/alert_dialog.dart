import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/view/view_rle.dart';

showAlertDialog(BuildContext context, TextEditingController myController) {
  Widget acceptButton = TextButton(
    child: const Text(
      "Accept",
      style: TextStyle(color: ColorsData.textPrimary, fontSize: 18),
    ),
    onPressed: () {
      Navigator.pop(context);
      if (myController.text != '' &&
          !myController.text.contains(RegExp(r'[^a-zA-Z]'))) {
        context.read<ViewRLE>().setOutFileExtension(myController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: ColorsData.backgroundAdditional,
          content: Text(
            "Wrong extension",
            style: TextStyle(color: ColorsData.textPrimary),
          ),
        ));
      }
    },
  );

  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(color: ColorsData.textPrimary, fontSize: 18),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  Widget textField = TextField(
      style: const TextStyle(color: ColorsData.textPrimary),
      controller: myController,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsData.textPrimary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsData.textPrimary),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsData.textPrimary),
        ),
        labelText: 'Enter here',
        labelStyle: TextStyle(color: ColorsData.textPrimary),
      ));

  AlertDialog alert = AlertDialog(
    backgroundColor: ColorsData.backgroundSecondPrimary,
    title: const Text('Insert extension',
        style: TextStyle(
          fontSize: 20,
          color: ColorsData.textPrimary,
        )),
    content: textField,
    actionsAlignment: MainAxisAlignment.spaceEvenly,
    actions: [
      cancelButton,
      acceptButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
