import 'package:flutter_pkm_sw/services/auth.dart';
import 'package:get/get.dart';

class ServiceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServices>(() => AuthServices());
  }
}
