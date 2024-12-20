// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDz1lXD5E0jF4XoWfjULaTLM0H7zU5otvU',
    appId: '1:506331868903:web:12427155cd66afbb7dfc42',
    messagingSenderId: '506331868903',
    projectId: 'examen-e88e1',
    authDomain: 'examen-e88e1.firebaseapp.com',
    storageBucket: 'examen-e88e1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfZEQ5bIGI9i2qADv35zb-GC8eIUSvbVA',
    appId: '1:506331868903:android:a1790975a690a4127dfc42',
    messagingSenderId: '506331868903',
    projectId: 'examen-e88e1',
    storageBucket: 'examen-e88e1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDmlp-Wn4g2eCkCSOQwnus3KuhMVmREGg',
    appId: '1:506331868903:ios:0214db5e42f323de7dfc42',
    messagingSenderId: '506331868903',
    projectId: 'examen-e88e1',
    storageBucket: 'examen-e88e1.firebasestorage.app',
    iosBundleId: 'com.codigocorrecto.examen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDmlp-Wn4g2eCkCSOQwnus3KuhMVmREGg',
    appId: '1:506331868903:ios:0214db5e42f323de7dfc42',
    messagingSenderId: '506331868903',
    projectId: 'examen-e88e1',
    storageBucket: 'examen-e88e1.firebasestorage.app',
    iosBundleId: 'com.codigocorrecto.examen',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDz1lXD5E0jF4XoWfjULaTLM0H7zU5otvU',
    appId: '1:506331868903:web:0b794bf62c9bc1dc7dfc42',
    messagingSenderId: '506331868903',
    projectId: 'examen-e88e1',
    authDomain: 'examen-e88e1.firebaseapp.com',
    storageBucket: 'examen-e88e1.firebasestorage.app',
  );
}
