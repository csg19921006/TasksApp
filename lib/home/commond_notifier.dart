import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app_flutter_project/base/hive_use_case.dart';

part 'commond_notifier.g.dart';

@riverpod
HiveUseCase hiveUseCase(HiveUseCaseRef ref) {
  return HiveUseCase();
}
