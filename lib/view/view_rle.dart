import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rle_compress/data/rle_compressor.dart';

class ViewRLE extends ChangeNotifier {
  String pickedFile = 'example.bmp', outFileExtension = 'bmp';
  double sizeMbBefore = 0.00, sizeMbAfter = 0.00, percent = 0.0;
  bool _compress = true, ready = false;
  int bytesBefore = 0;

  Uint8List? fileBytes;

  Future getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (result != null) {
      fileBytes =
          await File(result.files.single.path!).readAsBytes().then((value) {
        sizeMbBefore = value.length / 1024 / 1024;
        pickedFile = result.paths.single!.split('/').last;
        outFileExtension = pickedFile.split('.').last;
        ready = true;
        bytesBefore = value.length;
        return value;
      });

      notifyListeners();
    }
  }

  Future<void> RLE() async {
    if (_compress) {
      fileBytes = CompressionRLE.compression(fileBytes!);
      sizeMbAfter = fileBytes!.length / 1024 / 1024;
      percent = (bytesBefore - fileBytes!.length) / (bytesBefore / 100);
    } else {
      fileBytes = CompressionRLE.decompression(fileBytes!);
      sizeMbAfter = fileBytes!.length / 1024 / 1024;
      percent = (bytesBefore - fileBytes!.length) / (bytesBefore / 100);
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
      if (selectedDirectory != null) {
        File(selectedDirectory + '/out_' + pickedFile).writeAsBytes(fileBytes!);
      }
      ready = false;
      notifyListeners();
    });
  }

  void changeCompress() {
    _compress = !_compress;
    notifyListeners();
  }
}
