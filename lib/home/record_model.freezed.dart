// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordModel {
// 記録日付
  @HiveField(0)
  DateTime? get recordDate => throw _privateConstructorUsedError; // 目標日付
  @HiveField(1)
  DateTime? get targetDate => throw _privateConstructorUsedError; // title
  @HiveField(2)
  String get title => throw _privateConstructorUsedError; // 備考
  @HiveField(3)
  String get note =>
      throw _privateConstructorUsedError; // 状態: false: 未完成 true: 完成
  @HiveField(4)
  bool get status => throw _privateConstructorUsedError; // 状態: 0:  1:
  @HiveField(5)
  int get favorite => throw _privateConstructorUsedError; //
  @HiveField(6)
  int get timeStamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordModelCopyWith<RecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordModelCopyWith<$Res> {
  factory $RecordModelCopyWith(
          RecordModel value, $Res Function(RecordModel) then) =
      _$RecordModelCopyWithImpl<$Res, RecordModel>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime? recordDate,
      @HiveField(1) DateTime? targetDate,
      @HiveField(2) String title,
      @HiveField(3) String note,
      @HiveField(4) bool status,
      @HiveField(5) int favorite,
      @HiveField(6) int timeStamp});
}

/// @nodoc
class _$RecordModelCopyWithImpl<$Res, $Val extends RecordModel>
    implements $RecordModelCopyWith<$Res> {
  _$RecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordDate = freezed,
    Object? targetDate = freezed,
    Object? title = null,
    Object? note = null,
    Object? status = null,
    Object? favorite = null,
    Object? timeStamp = null,
  }) {
    return _then(_value.copyWith(
      recordDate: freezed == recordDate
          ? _value.recordDate
          : recordDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetDate: freezed == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordModelImplCopyWith<$Res>
    implements $RecordModelCopyWith<$Res> {
  factory _$$RecordModelImplCopyWith(
          _$RecordModelImpl value, $Res Function(_$RecordModelImpl) then) =
      __$$RecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime? recordDate,
      @HiveField(1) DateTime? targetDate,
      @HiveField(2) String title,
      @HiveField(3) String note,
      @HiveField(4) bool status,
      @HiveField(5) int favorite,
      @HiveField(6) int timeStamp});
}

/// @nodoc
class __$$RecordModelImplCopyWithImpl<$Res>
    extends _$RecordModelCopyWithImpl<$Res, _$RecordModelImpl>
    implements _$$RecordModelImplCopyWith<$Res> {
  __$$RecordModelImplCopyWithImpl(
      _$RecordModelImpl _value, $Res Function(_$RecordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordDate = freezed,
    Object? targetDate = freezed,
    Object? title = null,
    Object? note = null,
    Object? status = null,
    Object? favorite = null,
    Object? timeStamp = null,
  }) {
    return _then(_$RecordModelImpl(
      recordDate: freezed == recordDate
          ? _value.recordDate
          : recordDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetDate: freezed == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$RecordModelImpl implements _RecordModel {
  _$RecordModelImpl(
      {@HiveField(0) this.recordDate,
      @HiveField(1) this.targetDate,
      @HiveField(2) required this.title,
      @HiveField(3) required this.note,
      @HiveField(4) required this.status,
      @HiveField(5) required this.favorite,
      @HiveField(6) required this.timeStamp});

// 記録日付
  @override
  @HiveField(0)
  final DateTime? recordDate;
// 目標日付
  @override
  @HiveField(1)
  final DateTime? targetDate;
// title
  @override
  @HiveField(2)
  final String title;
// 備考
  @override
  @HiveField(3)
  final String note;
// 状態: false: 未完成 true: 完成
  @override
  @HiveField(4)
  final bool status;
// 状態: 0:  1:
  @override
  @HiveField(5)
  final int favorite;
//
  @override
  @HiveField(6)
  final int timeStamp;

  @override
  String toString() {
    return 'RecordModel(recordDate: $recordDate, targetDate: $targetDate, title: $title, note: $note, status: $status, favorite: $favorite, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordModelImpl &&
            (identical(other.recordDate, recordDate) ||
                other.recordDate == recordDate) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recordDate, targetDate, title,
      note, status, favorite, timeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordModelImplCopyWith<_$RecordModelImpl> get copyWith =>
      __$$RecordModelImplCopyWithImpl<_$RecordModelImpl>(this, _$identity);
}

abstract class _RecordModel implements RecordModel {
  factory _RecordModel(
      {@HiveField(0) final DateTime? recordDate,
      @HiveField(1) final DateTime? targetDate,
      @HiveField(2) required final String title,
      @HiveField(3) required final String note,
      @HiveField(4) required final bool status,
      @HiveField(5) required final int favorite,
      @HiveField(6) required final int timeStamp}) = _$RecordModelImpl;

  @override // 記録日付
  @HiveField(0)
  DateTime? get recordDate;
  @override // 目標日付
  @HiveField(1)
  DateTime? get targetDate;
  @override // title
  @HiveField(2)
  String get title;
  @override // 備考
  @HiveField(3)
  String get note;
  @override // 状態: false: 未完成 true: 完成
  @HiveField(4)
  bool get status;
  @override // 状態: 0:  1:
  @HiveField(5)
  int get favorite;
  @override //
  @HiveField(6)
  int get timeStamp;
  @override
  @JsonKey(ignore: true)
  _$$RecordModelImplCopyWith<_$RecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
