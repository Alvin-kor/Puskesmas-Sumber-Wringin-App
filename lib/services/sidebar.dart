import 'package:flutter_pkm_sw/screens/home/home.dart';
import 'package:flutter_pkm_sw/screens/kia/kia.dart';
import 'package:get/get.dart';

class Sidebar extends GetxController {
  final showSidebar = false.obs;
  final selectedIndex = 0.obs;

  showSidebarHandle() {
    showSidebar.value == false ? showSidebar(true) : showSidebar(false);
  }

  selectedIndexHandle(index) {
    if (selectedIndex != index) {
      if (index == 0) {
        Get.to(Home());
      } else if (index == 1) {
        Get.to(KIA());
      }
      selectedIndex.value = index;
    } else {
      selectedIndex.value = index;
    }
  }
}
