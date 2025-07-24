abstract class AppException implements Exception {
  final String message;
  final int? code;
  final dynamic error;

  AppException({
    required this.message,
    this.code,
    this.error,
  });

  @override
  String toString() => 'AppException: $message (Code: $code)';
}
