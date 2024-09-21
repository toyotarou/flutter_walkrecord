import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utility {
  /// 背景取得
  Widget getBackGround() {
    return Image.asset(
      'assets/images/walk.png',
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.7),
      colorBlendMode: BlendMode.darken,
    );
  }

  /// 月末日取得
  late String monthEndDateTime;

  void makeMonthEnd(int year, int month, int day) {
    monthEndDateTime = DateTime(year, month, day).toString();
  }

  /// 金額を3桁区切りで表示する
  final formatter = NumberFormat("#,###");

  String makeCurrencyDisplay(String text) {
    return formatter.format(int.parse(text));
  }

  /// 背景色取得
  Color getBgColor(String date, List holidayList) {
    makeYMDYData(date);

    Color? color;

    switch (youbiNo) {
      case 0:
        color = Colors.redAccent[700]!.withOpacity(0.3);
        break;

      case 6:
        color = Colors.blueAccent[700]!.withOpacity(0.3);
        break;

      default:
        color = Colors.black.withOpacity(0.3);
        break;
    }

    if (holidayList.contains(date)) {
      color = Colors.greenAccent[700]!.withOpacity(0.3);
    }

    return color;
  }

  /// 日付データ作成
  late String year;
  late String month;
  late String day;
  late String youbi;
  late String youbiStr;
  late int youbiNo;

  void makeYMDYData(String date) {
    List explodedDate = date.split(' ');
    List explodedSelectedDate = explodedDate[0].split('-');
    year = explodedSelectedDate[0];
    month = explodedSelectedDate[1];
    day = explodedSelectedDate[2];

    DateTime youbiDate =
        DateTime(int.parse(year), int.parse(month), int.parse(day));
    youbi = DateFormat('EEEE').format(youbiDate);
    switch (youbi) {
      case "Sunday":
        youbiStr = "日";
        youbiNo = 0;
        break;
      case "Monday":
        youbiStr = "月";
        youbiNo = 1;
        break;
      case "Tuesday":
        youbiStr = "火";
        youbiNo = 2;
        break;
      case "Wednesday":
        youbiStr = "水";
        youbiNo = 3;
        break;
      case "Thursday":
        youbiStr = "木";
        youbiNo = 4;
        break;
      case "Friday":
        youbiStr = "金";
        youbiNo = 5;
        break;
      case "Saturday":
        youbiStr = "土";
        youbiNo = 6;
        break;
    }
  }
}
