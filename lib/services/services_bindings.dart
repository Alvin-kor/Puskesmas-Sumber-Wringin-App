import 'package:flutter_pkm_sw/services/auth.dart';
import 'package:flutter_pkm_sw/services/sidebar.dart';
import 'package:get/get.dart';

class ServiceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServices>(() => AuthServices());
    Get.lazyPut<Sidebar>(() => Sidebar());
  }
}
