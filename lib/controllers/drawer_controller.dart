import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/bool/bool_values.dart';
import 'package:route_between_two_points/pages/Drawer_right/drawer_right.dart';
import 'package:route_between_two_points/pages/Drawer_right/filter_drawer.dart';
import 'package:route_between_two_points/pages/Drawer_right/statis_drawer_filter.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    BoolValues _val = Get.put(BoolValues());
    return _val.showFilterDrawer.value ? FilterDrawer() : DrawerRight();
  }
}

class StaticDra extends StatelessWidget {
  const StaticDra({super.key});

  @override
  Widget build(BuildContext context) {
    BoolValues _val = Get.put(BoolValues());
    return _val.showStatisticDrawer.value
        ? StaticticDrawerFilter()
        : DrawerRight();
  }
}
