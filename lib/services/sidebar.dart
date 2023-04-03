import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends GetxController {
  final showSidebar = false.obs;

  showSidebarHandle() {
    showSidebar.value == false ? showSidebar(true) : showSidebar(false);
  }
}
