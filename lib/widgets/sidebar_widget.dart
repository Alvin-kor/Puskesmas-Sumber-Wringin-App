import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/services/sidebar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomSidebar extends StatelessWidget {
  CustomSidebar({super.key});
  final _sidebar = Get.find<Sidebar>();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 500;
    if (isDesktop) {
      return Obx(
        () => AnimatedSlide(
          offset: _sidebar.showSidebar.value
              ? const Offset(0.0, 0.0)
              : const Offset(-1.0, 0.0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Row(children: [
            NavigationRail(
              elevation: 4.0,
              minWidth: MediaQuery.of(context).size.width * 0.04,
              backgroundColor: const Color.fromARGB(255, 247, 255, 255),
              groupAlignment: -1.0,
              labelType: NavigationRailLabelType.selected,
              selectedIndex: 0,
              destinations: const [
                NavigationRailDestination(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                  icon: Icon(Icons.dashboard),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Trending'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.date_range),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Trending'),
                ),
              ],
            )
          ]),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
