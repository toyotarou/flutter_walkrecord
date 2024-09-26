import '../extensions/extensions.dart';

class WalkRecordModel {
  WalkRecordModel({
    required this.date,
    required this.step,
    required this.distance,
    required this.timeplace,
    required this.temple,
    required this.mercari,
    required this.train,
    required this.spend,
  });

  factory WalkRecordModel.fromJson(Map<String, dynamic> json) =>
      WalkRecordModel(
        date: json['date'].toString(),
        step: json['step'].toString().toInt(),
        distance: json['distance'].toString().toInt(),
        timeplace: json['timeplace'].toString(),
        temple: json['temple'].toString(),
        mercari: json['mercari'].toString(),
        train: json['train'].toString(),
        spend: json['spend'].toString(),
      );

  String date;
  int step;
  int distance;
  String timeplace;
  String temple;
  String mercari;
  String train;
  String spend;
}
