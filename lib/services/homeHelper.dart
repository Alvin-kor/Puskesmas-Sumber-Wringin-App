import 'package:get/get.dart';

class HomeHelper extends GetxController {
  final visibleKIA = false.obs;

  visibleKIAHandle() {
    visibleKIA.value == false
        ? visibleKIA.value = true
        : visibleKIA.value = false;
  }
}
