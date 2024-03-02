import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TechnicalMaintenance extends StatefulWidget {
  VoidCallback onNext;
  VoidCallback onBack;
  TechnicalMaintenance({super.key, required this.onNext, required this.onBack});

  @override
  State<TechnicalMaintenance> createState() => _TechnicalMaintenanceState();
}

class _TechnicalMaintenanceState extends State<TechnicalMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('Technical'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onBack();
                  },
                  child: Text('back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onNext();
                  },
                  child: Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
