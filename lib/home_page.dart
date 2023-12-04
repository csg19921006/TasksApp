import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app_flutter_project/base/base_page.dart';
import 'package:tasks_app_flutter_project/home_view_model.dart';
import 'package:tasks_app_flutter_project/record_detail_page.dart';
import 'package:tasks_app_flutter_project/record_model.dart';

class HomePage extends StatelessWidget with BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('homeTitle'.tr()),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(homeViewModelProvider).pageState;
          return initBody(
            pageState: pageState,
            normalBody: _buildNormalBodyWidget(context, ref),
          );
        },
      ),
    );
  }

  Widget _buildNormalBodyWidget(BuildContext context, WidgetRef ref) {
    final focusNode = ref.read(homeViewModelProvider.notifier).focusNode;
    final double bottom;
    if (focusNode.hasFocus) {
      bottom = MediaQuery.of(context).viewInsets.bottom;
    } else {
      bottom = MediaQuery.of(context).viewInsets.bottom - 50.0;
    }
    return Stack(
      children: [
        Column(
          children: [
            _buildListWidget(context, ref),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu),
                GestureDetector(
                  child: const Icon(Icons.add),
                  onTap: () {
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
          ],
        ),
        Positioned(
          left: 0.0,
          bottom: bottom,
          right: 0.0,
          child: Container(
            height: 50.0,
            decoration: const BoxDecoration(color: Colors.pink),
            child: TextField(
              controller: ref.read(homeViewModelProvider.notifier).controller,
              focusNode: focusNode,
              onSubmitted: (value) {
                ref
                    .read(homeViewModelProvider.notifier)
                    .addRecord(title: value);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListWidget(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          ref.read(homeViewModelProvider.notifier).readRecordList();
        },
        child: ListView(
          children: ref
              .read(homeViewModelProvider.notifier)
              .readRecordList()
              .map(
                (e) => HomeItemWidget(
                  model: e,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordDetailPage(model: e)));
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class HomeItemWidget extends StatelessWidget {
  final RecordModel model;
  final VoidCallback onTap;
  const HomeItemWidget({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.ac_unit),
                  Text(model.title),
                  const Text('\$2.0'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
