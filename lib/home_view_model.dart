import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app_flutter_project/base/base_view_model.dart';
import 'package:tasks_app_flutter_project/home_use_case.dart';
import 'package:tasks_app_flutter_project/record_model.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose<HomeViewModel>(
    (ref) => HomeViewModel(HomePageUseCase()));

class HomeViewModel extends BaseViewModel {
  final HomePageUseCase _useCase;

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

  void addRecord() {
    final model = RecordModel('数量', 'category', 'recordDate', 'targetDate',
        'note', 'currency', 'accountBookName');
    hiveUseCase.addRecord(model);
    notifyListeners();
  }
}
