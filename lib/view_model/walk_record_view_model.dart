import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart';

import '../state/walk_record_state.dart';

//////////////////////////////////////////////////////////////////////
final walkRecordProvider = StateNotifierProvider.autoDispose
    .family<WalkRecordStateNotifier, List<WalkRecordState>, String>(
        (ref, year) {
  return WalkRecordStateNotifier([])..getWalkRecord(year: year);
});

class WalkRecordStateNotifier extends StateNotifier<List<WalkRecordState>> {
  WalkRecordStateNotifier(List<WalkRecordState> state) : super(state);

  ///
  void getWalkRecord({required String year}) async {
    String url = "http://toyohide.work/BrainLog/api/getWalkRecord2";
    Map<String, String> headers = {'content-type': 'application/json'};

    Response response = await post(Uri.parse(url), headers: headers);

    var walkRecord = jsonDecode(response.body);

    List<WalkRecordState> list = [];
    for (var i = 0; i < walkRecord.length; i++) {
      var exOneDate = walkRecord[i]['date'].split('-');
      if (year == exOneDate[0]) {
        list.add(
          WalkRecordState(
            date: walkRecord[i]['date'],
            step: walkRecord[i]['step'],
            distance: walkRecord[i]['distance'],
            timeplace: walkRecord[i]['timeplace'],
            temple: walkRecord[i]['temple'],
            mercari: walkRecord[i]['mercari'],
            train: walkRecord[i]['train'],
            spend: walkRecord[i]['spend'].toString(),
          ),
        );
      }
    }

    state = list;
  }
}

//////////////////////////////////////////////////////////////////////
