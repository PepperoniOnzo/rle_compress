import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ViewRLE extends ChangeNotifier {
  String pickedFile = 'example.bmp', outFileExtension = 'bmp';
  double sizeMb = 0.00;
  bool _compress = true;

  Uint8List? fileBytes;

  Future getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      fileBytes =
          await File(result.files.single.path!).readAsBytes().then((value) {
        sizeMb = value.length / 1024 / 1024;
        pickedFile = result.paths.single!.split('/').last;
        outFileExtension = pickedFile.split('.').last;
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top]);
      });
      notifyListeners();
    }
  }

  void compressTime() => _compress = true;
  void deCompressTime() => _compress = false;
  
}
