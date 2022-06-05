import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rle_compress/data/history_data.dart';
import 'package:rle_compress/data/rle_compressor.dart';

class ViewRLE extends ChangeNotifier {
  String pickedFile = 'example.bmp',
      outFilePath = '/storage/emulated/0/Download',
      errorStr = 'Something went wrong';

  List<HistoryCardData> history = [];

  double sizeMbBefore = 0.00, sizeMbAfter = 0.00, percent = 0.0;
  bool _compress = true, ready = false, error = false;
  int bytesBefore = 0;

  Uint8List? fileBytes;

  addElementToHistory(HistoryCardData data) {
    history.insert(0, data);
  }

  Future getFile() async {
    await Permission.storage.request();

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (result != null) {
      fileBytes =
          await File(result.files.single.path!).readAsBytes().then((value) {
        sizeMbBefore = value.length / 1024 / 1024;
        pickedFile = result.paths.single!.split('/').last;
        ready = true;
        error = false;
        bytesBefore = value.length;
        return value;
      });

      notifyListeners();
    }
  }

  Future<void> changeDirectory() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      outFilePath = selectedDirectory;
    }
  }

  Future<void> readFileBytes() async {
    if (_compress) {
      if (pickedFile.split('.').last != 'rle') {
        fileBytes = await compute(CompressionRLE.compression, fileBytes!);
        error = false;
      } else {
        errorStr = "Can't compress RLE file";
        error = true;
      }
    } else {
      if (pickedFile.split('.').last == 'rle') {
        fileBytes = await compute(CompressionRLE.decompression, fileBytes!);
        error = false;
      } else {
        errorStr = "Not RLE format";
        error = true;
      }
    }
  }

  Future<void> RLE() async {
    readFileBytes().then((v) {
      if (!error) {
        sizeMbAfter = fileBytes!.length / 1024 / 1024;
        percent = (bytesBefore - fileBytes!.length) / (bytesBefore / 100);
        error = false;
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

        addElementToHistory(HistoryCardData(
            isCompressed: _compress,
            percentage: percent,
            mbSize: sizeMbBefore - sizeMbAfter,
            fileName: pickedFile));

        if (_compress) {
          File(outFilePath + '/out_' + pickedFile.split('.').first + '.rle')
              .writeAsBytes(fileBytes!);
        } else {
          File(outFilePath + '/out_' + pickedFile.split('.').first + '.bmp')
              .writeAsBytes(fileBytes!);
        }

        ready = false;
      } else {
        percent = 0.0;
        sizeMbAfter = 0.0;
        sizeMbBefore = 0.0;
        ready = false;
        error = true;
      }
    });

    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      notifyListeners();
    });
  }

  void changeCompress() {
    _compress = !_compress;
    ready = true;
    error = false;
    notifyListeners();
  }
}
