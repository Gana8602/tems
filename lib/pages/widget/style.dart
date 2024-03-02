import 'package:get/get.dart';

class MapStyle extends GetxController {
  String mapStyle =
      'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png';
  String dark =
      'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png';
  String white =
      'https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png';
  String standard =
      'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}';
  RxBool isLoading = false.obs;

  void changeStyle(String color) {
    isLoading.value = true;
    update();
    if (color == 'white') {
      mapStyle = white;

      // isLoading.value = false;
      update();
    } else if (color == 'dark') {
      mapStyle = dark;
      // isLoading.value = false;
    } else if (color == 'standard') {
      mapStyle = standard;
      // isLoading.value = false;
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      update();
      isLoading.value = false;
    });
  }
}
