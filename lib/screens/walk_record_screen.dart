import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
// import 'package:syncfusion_flutter_charts/charts.dart';
//

import '../utilities/utility.dart';
import '../view_model/holiday_view_model.dart';
import '../view_model/walk_record_view_model.dart';

// ignore: must_be_immutable
class WalkRecordScreen extends ConsumerWidget {
  WalkRecordScreen({super.key, required this.date});

  final String date;

  late BuildContext _context;
  late WidgetRef _ref;

  final Utility _utility = Utility();

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    _context = context;

    final exDate = date.split(' ');
    final exYmd = exDate[0].split('-');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Walk Record'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _utility.getBackGround(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: yearLinkButton(),

                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //
                //     // GestureDetector(
                //     //   onTap: () {
                //     //     showDialog(
                //     //       context: _context,
                //     //       builder: (_) {
                //     //         return WalkRecordGraphScreen(year: exYmd[0]);
                //     //       },
                //     //     );
                //     //   },
                //     //   child: const Icon(Icons.graphic_eq),
                //     // ),
                //   ],
                // ),
              ),
              const Divider(thickness: 2, color: Colors.white30),
              Expanded(child: walkRecordList(year: exYmd[0])),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  ///
  Widget yearLinkButton() {
    List<Widget> list = [];

    final now = DateTime.now().toString();
    final exNow = now.split(' ');
    final exNowYmd = exNow[0].split('-');

    final exDate = date.split(' ');
    final exYmd = exDate[0].split('-');

    for (var i = 2020; i <= int.parse(exNowYmd[0]); i++) {
      list.add(
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              _context,
              MaterialPageRoute(
                builder: (_) => WalkRecordScreen(date: i.toString()),
              ),
            );
          },
          child: Text(
            i.toString(),
            style: TextStyle(
                color: (i.toString() == exYmd[0])
                    ? Colors.greenAccent
                    : Colors.white),
          ),
        ),
      );
    }

    return Wrap(
      children: list,
    );
  }

  ///
  Widget walkRecordList({required String year}) {
    final walkRecordState = _ref.watch(walkRecordProvider(year));

    final holidayState = _ref.watch(holidayProvider);

    List<Widget> list = [];

    for (var i = 0; i < walkRecordState.length; i++) {
      list.add(
        Card(
          color: _utility.getBgColor(walkRecordState[i].date, holidayState),
          child: Row(
            children: [
              Expanded(
                child: Text(walkRecordState[i].date),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    _utility.makeCurrencyDisplay(
                      walkRecordState[i].step.toString(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    _utility.makeCurrencyDisplay(
                      walkRecordState[i].distance.toString(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => list[index],
            childCount: list.length,
          ),
        ),
      ],
    );
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

// class WalkRecordGraphScreen extends ConsumerWidget {
//   WalkRecordGraphScreen({Key? key, required this.year}) : super(key: key);
//
//   final String year;
//
//   late WidgetRef _ref;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     _ref = ref;
//
//     Size size = MediaQuery.of(context).size;
//
//     return AlertDialog(
//       backgroundColor: Colors.transparent,
//       contentPadding: EdgeInsets.zero,
//       content: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Container(
//           width: size.width * 10,
//           height: size.height - 100,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.2),
//           ),
//           child: Column(
//             children: [
//               _makeGraph(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   ///
//   Widget _makeGraph() {
//     final walkRecordState = _ref.watch(walkRecordProvider(year));
//
//     List<ChartData> _list = [];
//
//     for (var i = 0; i < walkRecordState.length; i++) {
//       _list.add(
//         ChartData(
//           x: DateTime.parse(walkRecordState[i].date),
//           step: walkRecordState[i].step,
//         ),
//       );
//     }
//
//     return Expanded(
//       child: SfCartesianChart(
//         series: <ChartSeries>[
//           LineSeries<ChartData, DateTime>(
//             color: Colors.yellowAccent,
//             width: 3,
//             dataSource: _list,
//             xValueMapper: (ChartData data, _) => data.x,
//             yValueMapper: (ChartData data, _) => data.step,
//             dataLabelSettings: const DataLabelSettings(isVisible: true),
//           ),
//         ],
//         primaryXAxis: DateTimeAxis(
//           majorGridLines: const MajorGridLines(width: 0),
//         ),
//         primaryYAxis: NumericAxis(
//           majorGridLines: const MajorGridLines(
//             width: 2,
//             color: Colors.white30,
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

// class ChartData {
//   final DateTime x;
//   final num step;
//
//   ChartData({required this.x, required this.step});
// }
