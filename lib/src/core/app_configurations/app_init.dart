import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liftcore/src/core/app_configurations/error_handlers.dart';
import 'package:liftcore/src/core/services/local_storage_service.dart';
import 'package:liftcore/src/core/utils/app_logger.dart';
import 'package:liftcore/firebase_options.dart';

/// Manages application initialization routines
class AppInit {
  const AppInit._();

  /// Initialize all required app configurations
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      registerErrorHandler();

      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);

      // Set preferred orientations
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Configure system UI overlay style
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );

      // Initialize other services here
      await _initializeServices();
    } catch (e) {
      AppLogger.error('Error during app initialization: $e');
      rethrow;
    }
  }

  static Future<void> _initializeServices() async {
    // Initialize local storage
    await LocalStorageService.getInstance();

    // - API clients
    // - Authentication services
    // - Analytics
    // - Crash reporting
    // - Push notifications
  }
}
