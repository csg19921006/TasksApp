// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$focusNodeHash() => r'5d083526cba483d7feab33042214d97011d5bba8';

/// See also [focusNode].
@ProviderFor(focusNode)
final focusNodeProvider = AutoDisposeProvider<FocusNode>.internal(
  focusNode,
  name: r'focusNodeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$focusNodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FocusNodeRef = AutoDisposeProviderRef<FocusNode>;
String _$textEditingControllerHash() =>
    r'3c1302b710513e97be5967f7951b0becfb2aec2d';

/// See also [textEditingController].
@ProviderFor(textEditingController)
final textEditingControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  textEditingController,
  name: r'textEditingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$textEditingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TextEditingControllerRef
    = AutoDisposeProviderRef<TextEditingController>;
String _$newRecordModelHash() => r'9331a6b7e8ee02c5b6fae09a6fd5aa286e58bd8d';

/// See also [newRecordModel].
@ProviderFor(newRecordModel)
final newRecordModelProvider = AutoDisposeProvider<RecordModel>.internal(
  newRecordModel,
  name: r'newRecordModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newRecordModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewRecordModelRef = AutoDisposeProviderRef<RecordModel>;
String _$homeNotifierHash() => r'768fb99897d2301ec7518fd28511f05073f6ccf0';

/// See also [HomeNotifier].
@ProviderFor(HomeNotifier)
final homeNotifierProvider =
    AutoDisposeAsyncNotifierProvider<HomeNotifier, HomeState>.internal(
  HomeNotifier.new,
  name: r'homeNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeNotifier = AutoDisposeAsyncNotifier<HomeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
