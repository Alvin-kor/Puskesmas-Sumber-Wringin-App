import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/screens/home/content.dart';
import 'package:flutter_pkm_sw/services/auth.dart';
// import 'package:flutter_pkm_sw/services/auth.dart';
import 'package:get/get.dart';

import 'package:flutter_pkm_sw/services/sidebar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  // final _auth = Get.find<AuthServices>();
  final _sidebar = Get.find<Sidebar>();
  final _auth = Get.find<AuthServices>();

  @override
  Widget build(BuildContext context) {
    final isMobileWidth = MediaQuery.of(context).size.width < 500;
    return Scaffold(
      appBar: AppBar(
        title: Text(isMobileWidth
            ? 'Sumber Wringin - Dashboard'
            : 'Welcome to Sumber Wringin App - Dashboard'),
        elevation: 4.0,
        leading: isMobileWidth
            ? null
            : Obx(() => _sidebar.showSidebar.value
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
        actions: [
          PopupMenuButton<int>(
              position: PopupMenuPosition.under,
              icon: const Icon(Icons.account_circle),
              itemBuilder: ((context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(Icons.manage_accounts),
                          SizedBox(width: 4.0),
                          Text('My Account'),
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(Icons.settings),
                          SizedBox(width: 4.0),
                          Text('Settings'),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem<int>(
                      onTap: () async {
                        await _auth.logOut();
                      },
                      value: 2,
                      child: Row(
                        children: const [
                          Icon(Icons.logout),
                          SizedBox(width: 4.0),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ]))
        ],
      ),
      body: ContentHome(),
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
