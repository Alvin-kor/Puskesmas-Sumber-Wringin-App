import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/screens/home/home.dart';
import 'package:flutter_pkm_sw/screens/kia/kia.dart';
import 'package:get/get.dart';

class Sidebar extends GetxController {
  final showSidebar = false.obs;
  final selectedIndex = 0.obs;

  showSidebarHandle() {
    showSidebar.value == false ? showSidebar(true) : showSidebar(false);
  }

  Future<dynamic> to(dynamic page, String pageName) async {
    Get.to(page,
        routeName: pageName,
        transition: Transition.leftToRightWithFade,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500));
  }

  selectedIndexHandle(index) {
    if (selectedIndex != index) {
      if (index == 0) {
        to(() => Home(), '/');
      } else if (index == 1) {
        to(() => KIA(), '/kia');
      }
      selectedIndex.value = index;
    } else {
      selectedIndex.value = index;
    }
  }
}
