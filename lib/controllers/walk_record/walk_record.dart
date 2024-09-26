import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/walk_record_model.dart';
import '../../utilities/utility.dart';

part 'walk_record.freezed.dart';

part 'walk_record.g.dart';

@freezed
class WalkRecordState with _$WalkRecordState {
  const factory WalkRecordState({
    // @Default(<WalkRecordModel>[]) List<WalkRecordModel> walkRecordModelList,
    //
    //
    //

    @Default(AsyncValue<List<WalkRecordModel>>.loading())
    AsyncValue<List<WalkRecordModel>> walkRecordModelList,
    @Default('') String selectedYear,
  }) = _WalkRecordState;
}

@Riverpod(keepAlive: true)
class WalkRecord extends _$WalkRecord {
  ///
  @override
  WalkRecordState build() {
    final int year = DateTime.now().year;

    return WalkRecordState(selectedYear: year.toString());
  }

  ///
  Future<void> getWalkRecord() async {
    final Utility utility = Utility();

    final HttpClient client = ref.read(httpClientProvider);

    // ignore: always_specify_types
    await client.post(path: APIPath.getWalkRecord2).then((value) {
      final List<WalkRecordModel> list = <WalkRecordModel>[];

      if (value != null) {
        // ignore: avoid_dynamic_calls
        for (int i = 0; i < value.length.toString().toInt(); i++) {
          final WalkRecordModel val =
              // ignore: avoid_dynamic_calls
              WalkRecordModel.fromJson(value[i] as Map<String, dynamic>);
          list.add(val);
        }
      }

      // ignore: always_specify_types
      state = state.copyWith(walkRecordModelList: AsyncValue.data(list));
      // ignore: always_specify_types
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  void setSelectedYear({required String year}) =>
      state = state.copyWith(selectedYear: year);
}
