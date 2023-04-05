import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pkm_sw/models/user.dart';
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
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData?>(context);
    return StreamProvider<UserData?>.value(
      value: AuthServices().userData,
      initialData: null,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        initialBinding: ServiceBindings(),
        initialRoute: '/',
        getPages: user != null
            ? [
                GetPage(name: '/', page: () => Home()),
              ]
            : [
                GetPage(name: '/', page: () => Wrapper()),
              ],
        home: Wrapper(),
      ),
    );
  }
}
