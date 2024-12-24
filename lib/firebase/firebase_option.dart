import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyC1fztRAynkoIc13-fqJkayk7RkrAyQULw',
      appId: '1:784158260531:android:522799d44809225273d246',
      messagingSenderId: '784158260531',
      projectId: 'student-data-9bafa',
      storageBucket: 'student-data-9bafa.firebasestorage.app',
      databaseURL:
      'https://student-data-9bafa-default-rtdb.firebaseio.com/');

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyC1fztRAynkoIc13-fqJkayk7RkrAyQULw',
      appId: '1:784158260531:android:522799d44809225273d246',
      messagingSenderId: '784158260531',
      projectId: 'student-data-9bafa',
      storageBucket: 'student-data-9bafa.firebasestorage.app',
      iosBundleId: 'com.app.firebase_student_data',
      databaseURL:
      'https://student-data-9bafa-default-rtdb.firebaseio.com/');
}