import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app_flutter_project/base/base_view_model.dart';

mixin BasePage {
  Widget initBody({
    required PageState pageState,
    required Widget normalBody,
  }) {
    switch (pageState) {
      case PageState.normal:
        return Container(
          color: Colors.white,
          child: normalBody,
        );
      case PageState.loading:
        return const Center(child: CircularProgressIndicator());
      case PageState.noneData:
        return const Text('error');
      case PageState.error:
        return const Text('error');
    }
  }
}
