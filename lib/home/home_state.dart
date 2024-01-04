import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasks_app_flutter_project/home/record_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required final List<RecordModel> sampleModelList,
  }) = _HomeState;
}
