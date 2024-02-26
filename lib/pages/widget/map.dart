import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/pages/widget/style.dart';

import 'source.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final MapStyle controller = Get.put(MapStyle());
    return FlutterMap(
      options: MapOptions(
        center: routePoints().routpoints[0],
        zoom: 10,
      ),
      children: [
        TileLayer(
          urlTemplate: controller.mapStyle,
          // 'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],

          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
                point: routePoints().routpoints[0],
                builder: (ctx) => InkWell(
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                      child: const Icon(
                        Icons.power_settings_new,
                        color: Colors.amber,
                      ),
                    )),
            Marker(
                point: routePoints().routpoints[1],
                builder: (ctx) => GestureDetector(
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                      child: const Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                      ),
                    ))
          ],
        ),
        const CircleLayer(
          circles: [],
        ),
      ],
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      elevation: 10,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Updated : ${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Text(
                        'Bhitarkanika National Park',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  // leading: Icon(Icons.music_note),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 140,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '35.4',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Temperature',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '°C',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ]),
                      ),
                      // Spacer(),

                      SizedBox(
                        height: 100,
                        width: 140,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '-',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Pressure',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Psi',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ]),
                      )
                    ],
                  ),
                  onTap: () {
                    // Do something
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.blue, width: 1)),
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    )),
                  ),
                  onTap: () {
                    // Do something
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
