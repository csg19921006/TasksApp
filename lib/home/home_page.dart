import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app_flutter_project/base/base_page.dart';
import 'package:tasks_app_flutter_project/home/home_notifier.dart';
import 'package:tasks_app_flutter_project/home/home_state.dart';
import 'package:tasks_app_flutter_project/home/record_detail_page.dart';
import 'package:tasks_app_flutter_project/home/record_model.dart';

class HomePage extends HookConsumerWidget with BasePage {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final textEditingController = ref.read(textEditingControllerProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('homeTitle'.tr()),
        ),
        body: state.when(data: (data) {
          return _buildNormalBodyWidget(context, ref, data);
        }, error: (error, trace) {
          return const Center(
            child: Text('error'),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
        bottomSheet: Offstage(
          offstage: !ref.read(focusNodeProvider).hasFocus,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'createTask'.tr(),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  controller: textEditingController,
                  focusNode: ref.read(focusNodeProvider),
                  onSubmitted: (value) {
                    textEditingController.clear();
                    ref
                        .read(homeNotifierProvider.notifier)
                        .addRecord(title: value);
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.blueAccent,
                        ),
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(
                              const Duration(days: 365 * 100),
                            ),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365 * 100),
                            ),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.access_time,
                        color: Colors.blueAccent,
                      ),
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 0, minute: 0),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNormalBodyWidget(
    BuildContext context,
    WidgetRef ref,
    HomeState state,
  ) {
    final focusNode = ref.read(focusNodeProvider);
    return Stack(
      children: [
        Column(
          children: [
            _buildListWidget(context, ref, state),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  GestureDetector(
                    child: const Icon(Icons.add),
                    onTap: () {
                      // debugPrint('key ==== ${focusNode.key}');
                      if (focusNode.hasFocus) {
                        focusNode.unfocus();
                      } else {
                        FocusScope.of(context).requestFocus(focusNode);
                      }
                    },
                  ),
                  const Icon(Icons.more_horiz),
                ],
              ),
            ),
          ],
        ),
        // Positioned(
        //   left: 0.0,
        //   bottom: bottom,
        //   right: 0.0,
        //   child: Container(
        //     height: 50.0,
        //     decoration: const BoxDecoration(color: Colors.pink),
        //     child: TextField(
        //       controller: ref.read(textEditingControllerProvider),
        //       focusNode: focusNode,
        //       onSubmitted: (value) {
        //         ref.read(homeNotifierProvider.notifier).addRecord(title: value);
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildListWidget(
    BuildContext context,
    WidgetRef ref,
    HomeState state,
  ) {
    final children = <Widget>[];
    for (int i = 0; i < state.sampleModelList.length; i++) {
      final item = state.sampleModelList[i];
      final widget = HomeItemWidget(
        previousModel: i > 0 ? state.sampleModelList[i - 1] : null,
        model: item,
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecordDetailPage(model: item)));
        },
        onChanged: (value) {
          final newModel = item.copyWith(status: value ?? false);
          ref.read(homeNotifierProvider.notifier).editRecord(model: newModel);
        },
      );
      children.add(widget);
    }
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          ref.read(homeNotifierProvider.notifier).refreshData();
        },
        child: ListView(children: children),
      ),
    );
  }
}

class HomeItemWidget extends StatelessWidget {
  final RecordModel? previousModel;
  final RecordModel model;
  final VoidCallback onTap;
  final ValueChanged<bool?> onChanged;
  const HomeItemWidget({
    Key? key,
    this.previousModel,
    required this.model,
    required this.onTap,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Offstage(
            offstage:
                model.isSameDayWithPreviousModel(previousModel?.targetDate),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
              child: Text(
                model.targetDateString,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(value: model.status, onChanged: onChanged),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title),
                  Text(model.targetDateTimeString),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
