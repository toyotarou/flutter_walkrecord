import 'package:freezed_annotation/freezed_annotation.dart';

part 'walk_record_state.freezed.dart';

@freezed
class WalkRecordState with _$WalkRecordState {
  const factory WalkRecordState({
    required String date,
    required int step,
    required int distance,
    required String timeplace,
    required String temple,
    required String mercari,
    required String train,
    required String spend,
  }) = _WalkRecordDetailState;
}
