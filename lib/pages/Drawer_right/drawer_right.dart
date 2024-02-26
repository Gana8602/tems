import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/pages/widget/style.dart';

class DrawerRight extends StatelessWidget {
  const DrawerRight({super.key});

  @override
  Widget build(BuildContext context) {
    final MapStyle controller = Get.find<MapStyle>();
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Theme Settings'),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            const Divider(),
            SizedBox(
              height: 120,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Map Layers'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changeStyle('dark');
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/darkmap.png'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const Text(
                              'Dark Map',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _changeStyle(context, 'white');
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/whitemap.png'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const Text(
                              'White Map',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _changeStyle(context, 'standard');
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/satellitemap.png'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const Text(
                              'Satellite',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void _changeStyle(BuildContext context, String color) {
    final controller = Get.find<MapStyle>();
    controller.changeStyle(color);
  }
}
