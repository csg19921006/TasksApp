import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app_flutter_project/base/base_view_model.dart';
import 'package:tasks_app_flutter_project/home_use_case.dart';
import 'package:tasks_app_flutter_project/record_model.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose<HomeViewModel>(
    (ref) => HomeViewModel(HomePageUseCase()));

class HomeViewModel extends BaseViewModel {
  final HomePageUseCase _useCase;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  HomeViewModel(this._useCase) {
    _loadData();
  }

  void _loadData() async {
    pageState = PageState.loading;
    try {
      await _useCase.loadData();
      pageState = PageState.normal;
    } catch (e) {
      pageState = PageState.error;
    }
  }

  void reFreshData() {
    _loadData();
  }

  List<RecordModel> readRecordList() {
    return hiveUseCase.readRecordList();
  }

  void addRecord({required String title}) {
    final model = RecordModel(
      recordDate: '2023/12/05 02:00',
      targetDate: '2023/12/31 12:00',
      title: title,
      note: 'note',
      status: true,
      favorited: true,
      timeStamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );
    hiveUseCase.addRecord(model);
  }

  void deleteRecord({required RecordModel model}) {
    hiveUseCase.deleteRecord(model);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
