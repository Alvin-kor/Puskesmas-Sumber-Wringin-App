// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCUxZA7f1bFQNjhMWSRL4J0rneW75eJp4',
    appId: '1:813061672284:web:7bc03f4f79857c01b94599',
    messagingSenderId: '813061672284',
    projectId: 'sumber-wringin-flutter',
    authDomain: 'sumber-wringin-flutter.firebaseapp.com',
    storageBucket: 'sumber-wringin-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvsLtyFqWEU2XKcu3O5OdPDAG7YMNRCaE',
    appId: '1:813061672284:android:c697a5a63f7ece41b94599',
    messagingSenderId: '813061672284',
    projectId: 'sumber-wringin-flutter',
    storageBucket: 'sumber-wringin-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDovOZvXC1rkC4qrnhlJAnIzkdJ0_fVSrQ',
    appId: '1:813061672284:ios:c970ac26d4bf983bb94599',
    messagingSenderId: '813061672284',
    projectId: 'sumber-wringin-flutter',
    storageBucket: 'sumber-wringin-flutter.appspot.com',
    iosClientId: '813061672284-pnarkkl13thvecifhppbgj11b95jqivn.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPkmSw',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDovOZvXC1rkC4qrnhlJAnIzkdJ0_fVSrQ',
    appId: '1:813061672284:ios:c970ac26d4bf983bb94599',
    messagingSenderId: '813061672284',
    projectId: 'sumber-wringin-flutter',
    storageBucket: 'sumber-wringin-flutter.appspot.com',
    iosClientId: '813061672284-pnarkkl13thvecifhppbgj11b95jqivn.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPkmSw',
  );
}
