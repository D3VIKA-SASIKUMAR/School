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
    apiKey: 'AIzaSyCkGy673YzpnlCjtRPz6t7WddIR7cuKvHo',
    appId: '1:790127097402:web:4f125afdda170d2df86703',
    messagingSenderId: '790127097402',
    projectId: 'eventapp-faa46',
    authDomain: 'eventapp-faa46.firebaseapp.com',
    storageBucket: 'eventapp-faa46.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUWkpREKy414ofKIf_697LPnMJxhuuaJM',
    appId: '1:790127097402:android:b638e226d74f2e20f86703',
    messagingSenderId: '790127097402',
    projectId: 'eventapp-faa46',
    storageBucket: 'eventapp-faa46.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8ptA9540t9kYmgqaK6kguovRlj9_Ldsc',
    appId: '1:790127097402:ios:780f914f16b095c5f86703',
    messagingSenderId: '790127097402',
    projectId: 'eventapp-faa46',
    storageBucket: 'eventapp-faa46.firebasestorage.app',
    iosBundleId: 'com.example.miniProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8ptA9540t9kYmgqaK6kguovRlj9_Ldsc',
    appId: '1:790127097402:ios:780f914f16b095c5f86703',
    messagingSenderId: '790127097402',
    projectId: 'eventapp-faa46',
    storageBucket: 'eventapp-faa46.firebasestorage.app',
    iosBundleId: 'com.example.miniProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCkGy673YzpnlCjtRPz6t7WddIR7cuKvHo',
    appId: '1:790127097402:web:f582df20973fd0aaf86703',
    messagingSenderId: '790127097402',
    projectId: 'eventapp-faa46',
    authDomain: 'eventapp-faa46.firebaseapp.com',
    storageBucket: 'eventapp-faa46.firebasestorage.app',
  );
}
