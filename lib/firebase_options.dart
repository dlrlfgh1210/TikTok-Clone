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
    apiKey: 'AIzaSyCBo-SnmOjszYSOYrniJjtf7KlEuwOoM6Q',
    appId: '1:930055301533:web:69451e561faa56bed5a774',
    messagingSenderId: '930055301533',
    projectId: 'tik-tok-clone-dlrlfgh1210',
    authDomain: 'tik-tok-clone-dlrlfgh1210.firebaseapp.com',
    storageBucket: 'tik-tok-clone-dlrlfgh1210.appspot.com',
    measurementId: 'G-XH09TP7GVR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBE1TI_YxQzRpWZN9R_nnuWZazDSQ6UfrU',
    appId: '1:930055301533:android:6f687cddf0bad213d5a774',
    messagingSenderId: '930055301533',
    projectId: 'tik-tok-clone-dlrlfgh1210',
    storageBucket: 'tik-tok-clone-dlrlfgh1210.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGztKd_UNSQAnG9tdn9lZHcWrL_MOoVAM',
    appId: '1:930055301533:ios:1f794bafc79d0526d5a774',
    messagingSenderId: '930055301533',
    projectId: 'tik-tok-clone-dlrlfgh1210',
    storageBucket: 'tik-tok-clone-dlrlfgh1210.appspot.com',
    androidClientId: '930055301533-s89mg1ajmtceevm2j9r156r02tcv0av0.apps.googleusercontent.com',
    iosClientId: '930055301533-usolb7o0q3caqb94nh2aidvar2lf900a.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTiktok',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGztKd_UNSQAnG9tdn9lZHcWrL_MOoVAM',
    appId: '1:930055301533:ios:44a4e9802ebaf97ad5a774',
    messagingSenderId: '930055301533',
    projectId: 'tik-tok-clone-dlrlfgh1210',
    storageBucket: 'tik-tok-clone-dlrlfgh1210.appspot.com',
    androidClientId: '930055301533-s89mg1ajmtceevm2j9r156r02tcv0av0.apps.googleusercontent.com',
    iosClientId: '930055301533-8afhe84lkkjcv2sf9hu7ptje6q144d2s.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTiktok.RunnerTests',
  );
}
