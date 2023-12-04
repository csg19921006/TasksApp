import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_app_flutter_project/record_model.dart';

class HiveUseCase extends ChangeNotifier {
  static HiveUseCase? _instance;
  factory HiveUseCase() => _instance ??= HiveUseCase._internal();
  HiveUseCase._internal();
  static const _recordBoxName = '_recordBoxName';
  late final Box _recordBox;
  late final Box _accountBookNameBox;
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(RecordModelAdapter());
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
    _accountBookNameBox.values;
    _recordBox.add(model);
  }
}
