import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_walkrecord/controllers/holidays/holidays_notifier.dart';
import 'package:flutter_walkrecord/controllers/holidays/holidays_response_state.dart';
import 'package:flutter_walkrecord/controllers/walk_record/walk_record.dart';
import 'package:flutter_walkrecord/extensions/extensions.dart';
import 'package:flutter_walkrecord/utilities/utility.dart';

class WalkRecordScreen extends ConsumerStatefulWidget {
  const WalkRecordScreen({super.key, required this.date});

  final String date;

  @override
  ConsumerState<WalkRecordScreen> createState() => _WalkRecordScreenState();
}

class _WalkRecordScreenState extends ConsumerState<WalkRecordScreen> {
  final Utility utility = Utility();

  Map<String, String> _holidayMap = <String, String>{};

  ///
  @override
  void initState() {
    super.initState();

    Future(() {
      ref.read(walkRecordProvider.notifier).getWalkRecord();
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          utility.getBackGround(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Container(width: context.screenSize.width),
                  SizedBox(
                    height: 50,
                    child: displayYearList(),
                  ),
                  Expanded(child: displayWalkRecordList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget displayYearList() {
    List<Widget> list = [];

    List<int> yearList = [];

    final selectedYear =
        ref.watch(walkRecordProvider.select((value) => value.selectedYear));

    ref
        .watch(walkRecordProvider.select((value) => value.walkRecordModelList))
        .forEach((element) {
      var year = DateTime.parse('${element.date} 00:00:00').year;

      if (!yearList.contains(year)) {
        list.add(
          GestureDetector(
            onTap: () {
              ref
                  .read(walkRecordProvider.notifier)
                  .setSelectedYear(year: year.toString());
            },
            child: SizedBox(
              width: 60,
              child: Text(
                year.toString(),
                style: TextStyle(
                    color: (year.toString() == selectedYear)
                        ? Colors.yellowAccent
                        : Colors.white),
              ),
            ),
          ),
        );
      }

      yearList.add(year);
    });

    return CustomScrollView(
      scrollDirection: Axis.horizontal,
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

  ///
  Widget displayWalkRecordList() {
    final HolidaysResponseState holidayState = ref.watch(holidayProvider);

    if (holidayState.holidayMap.value != null) {
      _holidayMap = holidayState.holidayMap.value!;
    }

    List<Widget> list = [];

    final selectedYear =
        ref.watch(walkRecordProvider.select((value) => value.selectedYear));

    ref
        .watch(walkRecordProvider.select((value) => value.walkRecordModelList))
        .forEach((element) {
      var year = DateTime.parse('${element.date} 00:00:00').year;

      if (year.toString() == selectedYear) {
        final String youbiStr =
            DateTime.parse('${element.date} 00:00:00').youbiStr;

        list.add(Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white.withOpacity(0.3)),
            ),
            color: utility.getYoubiColor(
                date: element.date,
                youbiStr: youbiStr,
                holidayMap: _holidayMap),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element.date),
              Text(element.step.toString().toCurrency()),
              Text(element.distance.toString().toCurrency()),
            ],
          ),
        ));
      }
    });

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
