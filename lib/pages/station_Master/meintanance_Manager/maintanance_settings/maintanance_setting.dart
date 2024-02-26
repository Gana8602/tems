import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';

class MaintananceSettings extends StatefulWidget {
  const MaintananceSettings({super.key});

  @override
  State<MaintananceSettings> createState() => _MaintananceSettingsState();
}

class _MaintananceSettingsState extends State<MaintananceSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head(context),
      drawer: const Drawerleft(),
      body: Center(child: Text('Maintenance Settings')),
    );
  }
}
