import 'dart:developer' as developer;
import 'package:logging/logging.dart';

class AppLogger {
  static final Logger _baseLogger = Logger('AppLogger');
  static final Logger network = Logger('NetworkLogger');

  static bool _initialized = false;

  // Initialize logging configuration
  static void initialize() {
    if (_initialized) return;

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final time = record.time.toString().substring(11, 23);
      final level = record.level.name.padRight(7);
      final loggerName = record.loggerName.padRight(12);
      final message = record.message;

      // Format the log message
      String formattedMessage = '[$time] $level [$loggerName] $message';

      // Add error and stack trace if present
      if (record.error != null) {
        formattedMessage += '\nError: ${record.error}';
      }
      if (record.stackTrace != null) {
        formattedMessage += '\nStack trace:\n${record.stackTrace}';
      }

      // Use dart:developer log for better debugging support
      developer.log(
        formattedMessage,
        name: record.loggerName,
        level: _mapLogLevel(record.level),
        error: record.error,
        stackTrace: record.stackTrace,
      );

      // Also print to console for visibility
      print(formattedMessage);
    });

    _initialized = true;
  }

  // Map logging package levels to dart:developer levels
  static int _mapLogLevel(Level level) {
    if (level >= Level.SEVERE) return 1000;
    if (level >= Level.WARNING) return 900;
    if (level >= Level.INFO) return 800;
    if (level >= Level.CONFIG) return 700;
    return 500; // FINE, FINER, FINEST
  }

  static void debug(dynamic message) {
    initialize();
    _baseLogger.fine(message);
  }

  static void info(dynamic message) {
    initialize();
    _baseLogger.info(message);
  }

  static void warning(dynamic message) {
    initialize();
    _baseLogger.warning(message);
  }

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    initialize();
    _baseLogger.severe(message, error, stackTrace);
  }

  // Additional convenience methods
  static void config(dynamic message) {
    initialize();
    _baseLogger.config(message);
  }

  static void fine(dynamic message) {
    initialize();
    _baseLogger.fine(message);
  }

  static void finer(dynamic message) {
    initialize();
    _baseLogger.finer(message);
  }

  static void finest(dynamic message) {
    initialize();
    _baseLogger.finest(message);
  }
}
