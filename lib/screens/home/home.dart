import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/widgets/custom_card_section.dart';
import 'package:flutter_pkm_sw/widgets/sidebar_widget.dart';
// import 'package:flutter_pkm_sw/services/auth.dart';
import 'package:get/get.dart';

import 'package:flutter_pkm_sw/services/sidebar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  // final _auth = Get.find<AuthServices>();
  final _sidebar = Get.find<Sidebar>();

  @override
  Widget build(BuildContext context) {
    final isMobileWidth = MediaQuery.of(context).size.width < 500;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Sumber Wringin App - Dashboard'),
        elevation: 4.0,
        leading: Obx(() => _sidebar.showSidebar.value
            ? TextButton(
                onPressed: () {
                  _sidebar.showSidebarHandle();
                },
                child: const Icon(Icons.arrow_back_ios_new))
            : TextButton(
                onPressed: () {
                  _sidebar.showSidebarHandle();
                },
                child: const Icon(Icons.menu_open))),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSidebar(),
          Obx(
            () => AnimatedSlide(
              offset: _sidebar.showSidebar.value
                  ? const Offset(0.0, 0.0)
                  : const Offset(-0.04, 0.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Container(
                margin: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  children: const [
                    Expanded(
                        flex: 1,
                        child: CustomCardSection(
                            icon: Icons.child_care_rounded,
                            placeholder: 'KIA')),
                    Expanded(
                        flex: 1,
                        child: CustomCardSection(
                            icon: Icons.food_bank, placeholder: 'Gizi')),
                    Expanded(
                        flex: 1,
                        child: CustomCardSection(
                            icon: Icons.vaccines, placeholder: 'Imunisasi')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isMobileWidth
          ? BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
            )
          : null,
    );
  }
}
