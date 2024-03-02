import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DailyProgressReport extends StatefulWidget {
  VoidCallback onBack;
  DailyProgressReport({super.key, required this.onBack});

  @override
  State<DailyProgressReport> createState() => _DailyProgressReportState();
}

class _DailyProgressReportState extends State<DailyProgressReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('Daily Progress Report'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onBack();
                  },
                  child: Text('back'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
