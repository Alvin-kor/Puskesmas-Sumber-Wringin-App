import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/services/auth.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final _auth = Get.find<AuthServices>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _auth.logOut();
        },
        child: const Text('Go Back'));
  }
}
