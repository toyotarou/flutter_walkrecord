import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/holidays/holidays_notifier.dart';
import '../controllers/holidays/holidays_response_state.dart';
import '../controllers/walk_record/walk_record.dart';
import '../extensions/extensions.dart';
import '../models/walk_record_model.dart';
import '../utilities/utility.dart';

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

    // ignore: always_specify_types
    Future(() {
      ref.read(walkRecordProvider.notifier).getWalkRecord();
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    final WalkRecordState walkRecordState = ref.watch(walkRecordProvider);
    final AsyncValue<List<WalkRecordModel>> walkRecordModelList =
        walkRecordState.walkRecordModelList;

    final String? lastDate = walkRecordModelList.value?.last.date;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      if (lastDate != null)
                        Text(
                          'lastdate: $lastDate',
                          style: const TextStyle(color: Colors.yellowAccent),
                        )
                      else
                        Container(),
                    ],
                  ),
                  const SizedBox(height: 10),
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
    return ref
        .watch(walkRecordProvider
            .select((WalkRecordState value) => value.walkRecordModelList))
        .when(
          data: (List<WalkRecordModel> value) {
            final List<Widget> list = <Widget>[];

            final List<int> yearList = <int>[];

            final String selectedYear = ref.watch(walkRecordProvider
                .select((WalkRecordState value) => value.selectedYear));

            for (final WalkRecordModel element in value) {
              final int year = DateTime.parse('${element.date} 00:00:00').year;

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
            }

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
          },
          error: (Object error, StackTrace stackTrace) =>
              const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }

  ///
  Widget displayWalkRecordList() {
    final HolidaysResponseState holidayState = ref.watch(holidayProvider);

    if (holidayState.holidayMap.value != null) {
      _holidayMap = holidayState.holidayMap.value!;
    }

    return ref
        .watch(walkRecordProvider
            .select((WalkRecordState value) => value.walkRecordModelList))
        .when(
          data: (List<WalkRecordModel> value) {
            final List<Widget> list = <Widget>[];

            final String selectedYear = ref.watch(walkRecordProvider
                .select((WalkRecordState value) => value.selectedYear));

            for (final WalkRecordModel element in value) {
              final int year = DateTime.parse('${element.date} 00:00:00').year;

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
                    children: <Widget>[
                      Expanded(child: Text(element.date)),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            element.step.toString().toCurrency(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            element.distance.toString().toCurrency(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
              }
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
          },
          error: (Object error, StackTrace stackTrace) =>
              const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
