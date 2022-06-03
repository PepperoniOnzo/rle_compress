import 'dart:typed_data';

class CompressionRLE {
  static Uint8List compression(Uint8List data) {
    if (data.length <= 1) {
      return data;
    }

    List<int> compressed = [];
    int position = 0;
    bool isRepeating = true;

    isRepeating = data[0] == data[1];
    isRepeating ? compressed.add(129) : compressed.add(1);
    compressed.add(data[0]);

    for (var i = 1; i < data.length; i++) {
      if (compressed[position] == 127 || compressed[position] == 255) {
        if (isRepeating) {
          position = compressed.length;
          compressed.add(128);
          compressed.add(data[i]);
        } else {
          position = compressed.length;
          compressed.add(1);
          compressed.add(data[i]);
        }
      }

      if (data[i] == compressed.last) {
        if (isRepeating) {
          compressed[position] += 1;
        } else {
          compressed[position] -= 1;
          position = compressed.length - 1;
          compressed[position] = 130;
          compressed.add(data[i]);
          isRepeating = true;
        }
      } else {
        if (isRepeating) {
          position = compressed.length;
          compressed.add(1);
          compressed.add(data[i]);
          isRepeating = false;
        } else {
          compressed[position] += 1;
          compressed.add(data[i]);
        }
      }
    }
    return Uint8List.fromList(compressed);
  }

  static Uint8List decompression(Uint8List data) {
    if (data.length <= 1) {
      return data;
    }
    List<int> decompressed = [];

    try {
      for (var i = 0; i < data.length; i++) {
        if (data[i] <= 127) {
          decompressed.addAll(data.skip(i + 1).take(data[i]));
          i += data[i];
        } else {
          decompressed.addAll(
              List<int>.generate(data[i] - 128, (index) => data[i + 1]));
          i += 1;
        }
      }
    } catch (e) {
      return Uint8List(0);
    }

    return Uint8List.fromList(decompressed);
  }
}
