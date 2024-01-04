import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'record_model.freezed.dart';
part 'record_model.g.dart';

@freezed
class RecordModel with _$RecordModel {
  @HiveType(typeId: 0)
  factory RecordModel({
    // 記録日付
    @HiveField(0) DateTime? recordDate,
    // 目標日付
    @HiveField(1) DateTime? targetDate,
    // title
    @HiveField(2) required String title,
    // 備考
    @HiveField(3) required String note,
    // 状態: false: 未完成 true: 完成
    @HiveField(4) required bool status,
    // 状態: 0:  1:
    @HiveField(5) required int favorite,
    //
    @HiveField(6) required int timeStamp,
  }) = _RecordModel;
}

extension RecordModelExtension on RecordModel {
  String get targetDateString {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  String get targetDateTimeString {
    return DateFormat('kk:MM').format(DateTime.now());
  }

  bool isSameDayWithPreviousModel(DateTime? previousModelDateTime) {
    return previousModelDateTime?.year == targetDate?.year &&
        previousModelDateTime?.month == targetDate?.month &&
        previousModelDateTime?.day == targetDate?.day;
  }
}
