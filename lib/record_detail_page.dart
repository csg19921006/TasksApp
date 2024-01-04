import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app_flutter_project/base/base_page.dart';
import 'package:tasks_app_flutter_project/home/home_notifier.dart';
import 'package:tasks_app_flutter_project/home/record_model.dart';
import 'package:tasks_app_flutter_project/record_detail_view_model.dart';

class RecordDetailPage extends StatelessWidget with BasePage {
  final RecordModel model;
  const RecordDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(recordDetailViewModelProvider).pageState;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              const Icon(Icons.star_border),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context, ref);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Icon(Icons.more_horiz),
                ),
              ),
            ],
          ),
          body: initBody(
            pageState: pageState,
            normalBody: _buildNormalBodyWidget(context, ref),
          ),
        );
      },
    );
  }

  Widget _buildNormalBodyWidget(BuildContext context, WidgetRef ref) {
    return Container();
  }

  void _showBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 60.0,
          child: GestureDetector(
            onTap: () {
              ref
                  .read(homeNotifierProvider.notifier)
                  .deleteRecord(model: model);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('delete'.tr()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
