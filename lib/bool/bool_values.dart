import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoolValues extends GetxController {
  BuildContext context;

  BoolValues(this.context);
  RxBool showFilterDrawer = false.obs;

  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> toggleDrawer(String val) async {
    if (val == 'filter') {
      print('filter run');
      showFilterDrawer.value = true;
    } else if (val == 'main') {
      print('main run');
      if (showFilterDrawer.value == false) {
        Scaffold.of(context).openEndDrawer();
      } else {
        showFilterDrawer.value = false;
      }
    } else {
      throw Error();
    }
    print(showFilterDrawer);
  }
}
