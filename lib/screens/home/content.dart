import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:flutter_pkm_sw/services/home_helper.dart';
import 'package:flutter_pkm_sw/services/sidebar.dart';
import 'package:flutter_pkm_sw/widgets/home/custom_card_section.dart';
import 'package:get/get.dart';

class ContentHome extends StatelessWidget {
  ContentHome({super.key});
  final _sidebar = Get.find<Sidebar>();
  final _homeHelper = Get.find<HomeHelper>();

  @override
  Widget build(BuildContext context) {
    final isMobileWidth = MediaQuery.of(context).size.width < 500;
    return Flexible(
      child: Obx(
        () => Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(20.0),
          child: AnimatedSlide(
            offset: _sidebar.showSidebar.value
                ? const Offset(0.0, 0.0)
                : isMobileWidth
                    ? const Offset(0.0, 0.0)
                    : const Offset(-0.04, 0.0),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: isMobileWidth ? Axis.vertical : Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return isMobileWidth
                    ? Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: CustomCardSection(
                                controller: () {
                                  _homeHelper.visibleKIAHandle();
                                },
                                icon: MaterialSymbols.breastfeeding,
                                placeholder: 'KIA'),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const CustomCardSection(
                                icon: MaterialSymbols.nutrition,
                                placeholder: 'Gizi'),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const CustomCardSection(
                                icon: MaterialSymbols.vaccines,
                                placeholder: 'Imunisasi'),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CustomCardSection(
                                controller: () {
                                  _homeHelper.visibleKIAHandle();
                                },
                                icon: MaterialSymbols.breastfeeding,
                                placeholder: 'KIA'),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const CustomCardSection(
                                icon: MaterialSymbols.nutrition,
                                placeholder: 'Gizi'),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: const CustomCardSection(
                                icon: MaterialSymbols.vaccines,
                                placeholder: 'Imunisasi'),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
