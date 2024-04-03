
// // @dart=2.9

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// // Toggle this to cause an async error to be thrown during initialization
// // and to test that runZonedGuarded() catches the error
// final _kShouldTestAsyncErrorOnInit = false;

// // Toggle this for testing Crashlytics in your app locally.
// final _kTestingCrashlytics = true;

// Future<void> _testAsyncErrorOnInit() async {
//   Future<void>.delayed(const Duration(seconds: 2), () {
//     var list = <int>[];
//     print(list[100]);
//   });
// }

// // Define an async function to initialize FlutterFire
// Future<void> initializeFlutterFire() async {
//   // Wait for Firebase to initialize
//   if (_kTestingCrashlytics) {
//     // Force enable crashlytics collection enabled if we're testing it.
//     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//   } else {
//     // Else only enable it in non-debug builds.
//     // You could additionally extend this to allow users to opt-in.
//     await FirebaseCrashlytics.instance
//         .setCrashlyticsCollectionEnabled(!kDebugMode);
//   }

//   // Pass all uncaught errors to Crashlytics.
//   Function originalOnError = FlutterError.onError;
//   FlutterError.onError = (FlutterErrorDetails errorDetails) async {
//     await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
//     // Forward to original handler.
//     originalOnError(errorDetails);
//   };

//   if (_kShouldTestAsyncErrorOnInit) {
//     await _testAsyncErrorOnInit();
//   }
// }