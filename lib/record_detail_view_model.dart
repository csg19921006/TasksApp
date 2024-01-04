import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app_flutter_project/base/base_view_model.dart';
import 'package:tasks_app_flutter_project/home/record_model.dart';
import 'package:tasks_app_flutter_project/record_detail_use_case.dart';

final recordDetailViewModelProvider =
    ChangeNotifierProvider.autoDispose<RecordDetailViewModel>(
        (ref) => RecordDetailViewModel(RecordDetailPageUseCase()));

class RecordDetailViewModel extends BaseViewModel {
  final RecordDetailPageUseCase _useCase;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  RecordDetailViewModel(this._useCase) {
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
