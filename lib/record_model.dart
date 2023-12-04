import 'package:hive/hive.dart';

part 'record_model.g.dart';

@HiveType(typeId: 1)
class RecordModel {
  @HiveField(0)
  // 数量
  String amountOfNumber;

  @HiveField(1)
  // 種類
  String category;

  @HiveField(2)
  // 記録日付
  String recordDate;

  @HiveField(3)
  // 目標日付
  String targetDate;

  @HiveField(4)
  // 備考
  String note;

  @HiveField(5)
  // 貨幣
  String currency;

  @HiveField(6)
  // 手帳名
  String accountBookName;

  RecordModel(
    this.amountOfNumber,
    this.category,
    this.recordDate,
    this.targetDate,
    this.note,
    this.currency,
    this.accountBookName,
  );
}
