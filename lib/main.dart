import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/screens/home/home.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_pkm_sw/firebase_options.dart';
import 'package:flutter_pkm_sw/color_schemes.dart';
import 'package:flutter_pkm_sw/screens/wrapper.dart';

// services
import 'services/services_bindings.dart';
import 'package:flutter_pkm_sw/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final auth = Get.put(AuthServices().isLogged.value);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialBinding: ServiceBindings(),
      initialRoute: '/',
      getPages: auth
          ? [
              GetPage(name: '/', page: () => Home()),
            ]
          : [
              GetPage(name: '/', page: () => const Wrapper()),
            ],
      home: const Wrapper(),
    );
  }
}
