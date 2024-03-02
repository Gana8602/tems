import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StandardProcedure extends StatefulWidget {
  VoidCallback onNext;
  VoidCallback onBack;
  StandardProcedure({super.key, required this.onNext, required this.onBack});

  @override
  State<StandardProcedure> createState() => _StandardProcedureState();
}

class _StandardProcedureState extends State<StandardProcedure> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('Standard Procedure'),
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
