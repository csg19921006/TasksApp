import 'package:flutter/cupertino.dart';
import 'package:tasks_app_flutter_project/base/hive_use_case.dart';

enum PageState {
  loading,
  normal,
  noneData,
  error,
}

class BaseViewModel extends ChangeNotifier {
  final hiveUseCase = HiveUseCase();
  bool _isDisposed = false;
  PageState _pageState = PageState.normal;
  PageState get pageState => _pageState;
  set pageState(value) {
    _pageState = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }
}
