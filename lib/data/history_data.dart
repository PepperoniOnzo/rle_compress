class HistoryCardData {
  bool isCompressed = true;
  double percentage = 0.0;
  double mbSize = 0.0;
  String fileName = 'example.bmb';

  HistoryCardData(
      {required this.isCompressed,
      required this.percentage,
      required this.mbSize,
      required this.fileName});

  HistoryCardData.fromJson(Map<String, dynamic> json) {
    isCompressed = json['isCompressed'];
    percentage = json['percentage'];
    mbSize = json['mbSize'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isCompressed'] = isCompressed;
    data['percentage'] = percentage;
    data['mbSize'] = mbSize;
    data['fileName'] = fileName;
    return data;
  }
}
