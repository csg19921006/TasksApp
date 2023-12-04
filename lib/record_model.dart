import 'package:hive/hive.dart';

part 'record_model.g.dart';

@HiveType(typeId: 0)
class RecordModel {
  @HiveField(0)
  // 記録日付
  final String recordDate;

  @HiveField(1)
  // 目標日付
  final String targetDate;

  @HiveField(2)
  // 備考
  final String title;

  @HiveField(3)
  // 備考
  final String note;

  @HiveField(4)
  // 状態: false: 未完成 true: 完成
  final bool status;

  @HiveField(5)
  // 状態: false:  true:
  final bool favorited;

  @HiveField(6)
  // timeStamp
  final int timeStamp;

  RecordModel({
    required this.recordDate,
    required this.targetDate,
    required this.title,
    required this.note,
    required this.status,
    required this.favorited,
    required this.timeStamp,
  });
}
