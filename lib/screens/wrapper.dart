import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/services/auth.dart';
import 'package:get/get.dart';
import 'package:flutter_pkm_sw/screens/authenticate/authenticate.dart';
import 'package:flutter_pkm_sw/screens/home/home.dart';

class Wrapper extends GetView<AuthServices> {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLogged.value ? const Home() : const Authenticate();
    });
  }
}
