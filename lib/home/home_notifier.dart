import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app_flutter_project/home/commond_notifier.dart';
import 'package:tasks_app_flutter_project/home/home_state.dart';
import 'package:tasks_app_flutter_project/home/record_model.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  Future<HomeState> build() async {
    final data = _loadData();
    return data;
  }

  Future<HomeState> _loadData({bool isFirstLoad = true}) async {
    return HomeState(
        sampleModelList: ref.read(hiveUseCaseProvider).readRecordList());
  }

  Future<void> refreshData() async {
    state = const AsyncValue.loading();
    final result = await _loadData(isFirstLoad: false);
    state = AsyncValue.data(result);
  }

  // List<RecordModel> readRecordList() {
  //   return ref.read(hiveUseCaseProvider).readRecordList();
  // }

  void addRecord({required String title}) async {
    final model = RecordModel(
      recordDate: DateTime.now(),
      targetDate: DateTime.now(),
      title: title,
      note: 'note',
      status: false,
      favorite: 0,
      timeStamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );
    // hiveUseCase.addRecord(model);
    ref.read(hiveUseCaseProvider).addRecord(model);
    final result = await _loadData(isFirstLoad: false);
    state = AsyncValue.data(result);
  }

  void deleteRecord({required RecordModel model}) {
    ref.read(hiveUseCaseProvider).deleteRecord(model);
  }

  void editRecord({required RecordModel model}) async {
    ref.read(hiveUseCaseProvider).editRecord(model);
    final result = await _loadData(isFirstLoad: false);
    state = AsyncValue.data(result);
  }
}

@riverpod
FocusNode focusNode(FocusNodeRef ref) {
  return useFocusNode();
}

@riverpod
TextEditingController textEditingController(TextEditingControllerRef ref) {
  return useTextEditingController();
}

@riverpod
RecordModel newRecordModel(NewRecordModelRef ref) {
  return RecordModel(
    title: '',
    note: '',
    status: false,
    favorite: 0,
    timeStamp: 0,
  );
}
