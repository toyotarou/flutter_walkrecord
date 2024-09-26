// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walk_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalkRecordState {
  List<WalkRecordModel> get walkRecordModelList =>
      throw _privateConstructorUsedError;
  String get selectedYear => throw _privateConstructorUsedError;

  /// Create a copy of WalkRecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalkRecordStateCopyWith<WalkRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkRecordStateCopyWith<$Res> {
  factory $WalkRecordStateCopyWith(
          WalkRecordState value, $Res Function(WalkRecordState) then) =
      _$WalkRecordStateCopyWithImpl<$Res, WalkRecordState>;
  @useResult
  $Res call({List<WalkRecordModel> walkRecordModelList, String selectedYear});
}

/// @nodoc
class _$WalkRecordStateCopyWithImpl<$Res, $Val extends WalkRecordState>
    implements $WalkRecordStateCopyWith<$Res> {
  _$WalkRecordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalkRecordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walkRecordModelList = null,
    Object? selectedYear = null,
  }) {
    return _then(_value.copyWith(
      walkRecordModelList: null == walkRecordModelList
          ? _value.walkRecordModelList
          : walkRecordModelList // ignore: cast_nullable_to_non_nullable
              as List<WalkRecordModel>,
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalkRecordStateImplCopyWith<$Res>
    implements $WalkRecordStateCopyWith<$Res> {
  factory _$$WalkRecordStateImplCopyWith(_$WalkRecordStateImpl value,
          $Res Function(_$WalkRecordStateImpl) then) =
      __$$WalkRecordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WalkRecordModel> walkRecordModelList, String selectedYear});
}

/// @nodoc
class __$$WalkRecordStateImplCopyWithImpl<$Res>
    extends _$WalkRecordStateCopyWithImpl<$Res, _$WalkRecordStateImpl>
    implements _$$WalkRecordStateImplCopyWith<$Res> {
  __$$WalkRecordStateImplCopyWithImpl(
      _$WalkRecordStateImpl _value, $Res Function(_$WalkRecordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalkRecordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walkRecordModelList = null,
    Object? selectedYear = null,
  }) {
    return _then(_$WalkRecordStateImpl(
      walkRecordModelList: null == walkRecordModelList
          ? _value._walkRecordModelList
          : walkRecordModelList // ignore: cast_nullable_to_non_nullable
              as List<WalkRecordModel>,
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalkRecordStateImpl implements _WalkRecordState {
  const _$WalkRecordStateImpl(
      {final List<WalkRecordModel> walkRecordModelList = const [],
      this.selectedYear = ''})
      : _walkRecordModelList = walkRecordModelList;

  final List<WalkRecordModel> _walkRecordModelList;
  @override
  @JsonKey()
  List<WalkRecordModel> get walkRecordModelList {
    if (_walkRecordModelList is EqualUnmodifiableListView)
      return _walkRecordModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walkRecordModelList);
  }

  @override
  @JsonKey()
  final String selectedYear;

  @override
  String toString() {
    return 'WalkRecordState(walkRecordModelList: $walkRecordModelList, selectedYear: $selectedYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalkRecordStateImpl &&
            const DeepCollectionEquality()
                .equals(other._walkRecordModelList, _walkRecordModelList) &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_walkRecordModelList), selectedYear);

  /// Create a copy of WalkRecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkRecordStateImplCopyWith<_$WalkRecordStateImpl> get copyWith =>
      __$$WalkRecordStateImplCopyWithImpl<_$WalkRecordStateImpl>(
          this, _$identity);
}

abstract class _WalkRecordState implements WalkRecordState {
  const factory _WalkRecordState(
      {final List<WalkRecordModel> walkRecordModelList,
      final String selectedYear}) = _$WalkRecordStateImpl;

  @override
  List<WalkRecordModel> get walkRecordModelList;
  @override
  String get selectedYear;

  /// Create a copy of WalkRecordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalkRecordStateImplCopyWith<_$WalkRecordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
