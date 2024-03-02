// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/pages/widget/style.dart';

import '../../utils/style.dart';
import '../widget/source.dart';

class FullView extends StatefulWidget {
  const FullView({super.key});

  @override
  State<FullView> createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  final MapStyle controller = Get.put(MapStyle());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.Blue, // Change the color as needed
    ));
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            center: routePoints().routpoints[0],
            zoom: 25,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                    point: routePoints().routpoints[0],
                    builder: ((context) => const Icon(
                          Icons.location_on,
                          color: Colors.blueAccent,
                        )))
              ],
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                    point: routePoints().routpoints[0],
                    radius: 18,
                    useRadiusInMeter: true,
                    color: Colors.yellow.withOpacity(0.5),
                    borderColor: Colors.yellow,
                    borderStrokeWidth: 2),
                CircleMarker(
                    point: routePoints().routpoints[0],
                    radius: 36,
                    useRadiusInMeter: true,
                    color: Colors.red.withOpacity(0.5),
                    borderColor: Colors.red,
                    borderStrokeWidth: 2)
              ],
            )
          ],
        ),
        Positioned(
          top: 25,
          left: 0,
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.fullscreen_rounded),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
