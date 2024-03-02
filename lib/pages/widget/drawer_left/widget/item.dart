// ignore_for_file: camel_case_types, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/pages/Configurations/Configuration.dart';
import 'package:route_between_two_points/pages/admin/notification_setting/notification_settings.dart';
import 'package:route_between_two_points/pages/admin/user_managment/user_manage.dart';
import 'package:route_between_two_points/pages/station_Master/Coumunication.dart/communication_center.dart';
import 'package:route_between_two_points/pages/admin/user_Log/log_user.dart';
import 'package:route_between_two_points/pages/station_Master/Station_Master/Station_Master.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenance_Requests/maintenance_requests.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/maintenance_dashboard.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/maintanance_settings/maintanance_setting.dart';

import '../../../../utils/style.dart';

// ignore: must_be_immutable
class DrawerItem extends StatelessWidget {
  String title;
  Color color;
  SvgPicture ic;
  VoidCallback ontap;

  DrawerItem(
      {super.key,
      required this.title,
      required this.color,
      required this.ic,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          ),
          leading: ic),
    );
  }
}

// ignore: must_be_immutable
class ExpandItem1 extends StatelessWidget {
  // List<String> title;

  String MainTitle;
  Color color;
  SvgPicture ic;
  ExpandItem1(
      {super.key,
      // required this.title,
      required this.color,
      required this.ic,
      required this.MainTitle});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      // childrenPadding: EdgeInsets.zero,
      leading: ic,
      title: Text(
        MainTitle,
        style: const TextStyle(color: Colors.white),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: ListTile(
            leading:
                SvgPicture.asset('assets/svg/com.svg', color: Colors.white),
            title: const Text(
              'Communication Center',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(const Communication());
              // Handle submenu 1 tap
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: ListTile(
            leading: SvgPicture.asset('assets/svg/s_master.svg',
                color: Colors.white),
            title: const Text(
              'Station Master',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(() => const StationMaster());
              // Handle submenu 2 tap
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: ListTile(
            leading: const Icon(Icons.settings_outlined, color: Colors.white),
            title: const Text(
              'Configuration',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(() => const ConfigurationsPage());
              // Handle submenu 2 tap
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: ListTile(
            leading: SvgPicture.asset(
              'assets/svg/data_manage.svg',
              color: Colors.white,
            ),
            title: const Text(
              'Data Management',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle submenu 2 tap
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: ExpandItem1_2(
                color: Colors.white,
                ic: SvgPicture.asset(
                  'assets/svg/spanner.svg',
                  color: Colors.white,
                ),
                MainTitle: 'Meintanance Manager')),
      ],
    );
  }
}

// ignore: must_be_immutable
class ExpandItem1_2 extends StatelessWidget {
  // List<String> title;
  String MainTitle;
  Color color;
  SvgPicture ic;
  ExpandItem1_2(
      {super.key,
      // required this.title,
      required this.color,
      required this.ic,
      required this.MainTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: AppColor.Blue,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        leading: ic,
        title: Text(
          MainTitle,
          style: const TextStyle(color: Colors.white),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: ListTile(
              leading: SvgPicture.asset('assets/svg/maintanance_settings.svg',
                  color: Colors.white),
              title: const Text(
                'Maintenance Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => const MaintananceSettings());
                // Handle submenu 1 tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: ListTile(
              leading: SvgPicture.asset('assets/svg/maintanance_dash.svg',
                  color: Colors.white),
              title: const Text(
                'Maintenance Dashboard',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => const MaintenanceDashboardPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ExpandItem2 extends StatelessWidget {
  // List<String> title;
  String MainTitle;
  Color color;
  SvgPicture ic;
  ExpandItem2(
      {super.key,
      // required this.title,
      required this.color,
      required this.ic,
      required this.MainTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: AppColor.Blue,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        leading: ic,
        title: Text(
          MainTitle,
          style: const TextStyle(color: Colors.white),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: ListTile(
              leading: SvgPicture.asset('assets/svg/person.svg',
                  color: Colors.white),
              title: const Text(
                'User Management',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => const UserManagment());
                // Handle submenu 1 tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: ListTile(
              leading: SvgPicture.asset('assets/svg/notify.svg',
                  color: Colors.white),
              title: const Text(
                'Notification Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => const NotificationSettings());
                // Handle submenu 2 tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: ListTile(
              leading: SvgPicture.asset('assets/svg/user_action_log.svg',
                  color: Colors.white),
              title: const Text(
                'User Action Log',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(() => const MyDataTablePage());
                // Handle submenu 2 tap
              },
            ),
          ),
        ],
      ),
    );
  }
}
