// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:route_between_two_points/bool/bool_values.dart';

class FloatButton extends StatefulWidget {
  const FloatButton({super.key});

  @override
  State<FloatButton> createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 20,
        right: 0, // Adjust 50.0 as needed
        child: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () {
                BoolValues(context).toggleDrawer('main');

                Future.delayed(const Duration(microseconds: 300), () {
                  if (BoolValues(context).showFilterDrawer.value == false) {
                    Scaffold.of(context).openEndDrawer();
                  } else {}
                });
              },
              backgroundColor: Colors.transparent,
              child: Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Lottie.asset('assets/svg/gear.json',
                          width: 8, height: 8),
                    ),
                  )),
            );
          },
        ),
      ),
    ]);
  }
}
