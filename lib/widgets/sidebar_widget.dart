import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:flutter_pkm_sw/services/sidebar.dart';
import 'package:get/get.dart';

class CustomSidebar extends StatelessWidget {
  CustomSidebar({super.key});
  final _sidebar = Get.find<Sidebar>();

  @override
  Widget build(BuildContext context) {
    destination(icon, placeholder) {
      return NavigationRailDestination(
        icon: Icon(
          icon,
          color: Colors.grey[300],
        ),
        selectedIcon: Icon(icon),
        label: Text(placeholder),
      );
    }

    final isDesktop = MediaQuery.of(context).size.width > 500;
    if (isDesktop) {
      return Obx(
        () => AnimatedSlide(
          offset: _sidebar.showSidebar.value
              ? const Offset(0.0, 0.0)
              : const Offset(-1.0, 0.0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: NavigationRail(
            useIndicator: false,
            elevation: 4.0,
            minWidth: MediaQuery.of(context).size.width * 0.04,
            backgroundColor: const Color.fromARGB(255, 247, 255, 255),
            groupAlignment: 0.0,
            labelType: NavigationRailLabelType.selected,
            selectedIndex: _sidebar.selectedIndex.value,
            onDestinationSelected: (index) =>
                _sidebar.selectedIndexHandle(index),
            destinations: [
              destination(MaterialSymbols.dashboard, 'Dashboard'),
              destination(MaterialSymbols.breastfeeding, 'KIA'),
              destination(MaterialSymbols.nutrition, 'Gizi'),
              destination(MaterialSymbols.vaccines, 'Imunisasi'),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
