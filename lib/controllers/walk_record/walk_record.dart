import 'package:flutter_walkrecord/data/http/client.dart';
import 'package:flutter_walkrecord/data/http/path.dart';
import 'package:flutter_walkrecord/extensions/extensions.dart';
import 'package:flutter_walkrecord/models/walk_record_model.dart';
import 'package:flutter_walkrecord/utilities/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'walk_record.freezed.dart';

part 'walk_record.g.dart';

@freezed
class WalkRecordState with _$WalkRecordState {
  const factory WalkRecordState({
    @Default([]) List<WalkRecordModel> walkRecordModelList,
    @Default('') String selectedYear,
  }) = _WalkRecordState;
}

@Riverpod(keepAlive: true)
class WalkRecord extends _$WalkRecord {
  ///
  @override
  WalkRecordState build() {
    var year = DateTime.now().year;

    return WalkRecordState(selectedYear: year.toString());
  }

  ///
  Future<void> getWalkRecord() async {
    final Utility utility = Utility();

    final HttpClient client = ref.read(httpClientProvider);

    await client.post(path: APIPath.getWalkRecord2).then((value) {
      final List<WalkRecordModel> list = <WalkRecordModel>[];

      if (value != null) {
        for (int i = 0; i < value.length.toString().toInt(); i++) {
          final WalkRecordModel val =
              WalkRecordModel.fromJson(value[i] as Map<String, dynamic>);
          list.add(val);
        }
      }

      state = state.copyWith(walkRecordModelList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  void setSelectedYear({required String year}) =>
      state = state.copyWith(selectedYear: year);
}
