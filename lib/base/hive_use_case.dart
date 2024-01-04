import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_app_flutter_project/home/record_model.dart';

class HiveUseCase extends ChangeNotifier {
  static HiveUseCase? _instance;
  factory HiveUseCase() => _instance ??= HiveUseCase._internal();
  HiveUseCase._internal();
  static const _recordBoxName = '_recordBoxName';
  late final Box _recordBox;
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(RecordModelImplAdapter());
    _recordBox = await Hive.openBox<RecordModel>(_recordBoxName);
  }

  List<RecordModel> readRecordList() {
    try {
      final result = List<RecordModel>.from(_recordBox.values);
      return result;
    } catch (_) {
      return [];
    }
  }

  Future<void> addRecord(RecordModel model) async {
    _recordBox.put(model.timeStamp, model);
  }

  Future<void> deleteRecord(RecordModel model) async {
    _recordBox.delete(model.timeStamp);
  }

  Future<void> editRecord(RecordModel model) async {
    _recordBox.put(model.timeStamp, model);
  }
}
