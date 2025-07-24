import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.data,
    this.loading,
    this.error,
    this.empty,
    this.onRetry,
    this.showLoadingOnRefresh = true,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = false,
    this.skipError = false,
    super.key,
  });

  /// The async value to handle
  final AsyncValue<T> value;

  /// Called when the async value has data
  final Widget Function(T data) data;

  /// Widget to show when loading. If null, shows a centered [CircularProgressIndicator]
  final Widget? loading;

  /// Widget to show when there's an error. If null, shows a centered error message
  final Widget Function(
      Object error, StackTrace? stackTrace, VoidCallback? retry)? error;

  /// Widget to show when data is null or empty (for lists)
  final Widget Function()? empty;

  /// Callback when retry is pressed on error widget
  final Future<void> Function()? onRetry;

  /// Whether to show loading state when refreshing. Defaults to true
  final bool showLoadingOnRefresh;

  /// Whether to skip loading state when reloading. Defaults to false
  final bool skipLoadingOnReload;

  /// Whether to skip loading state when refreshing. Defaults to false
  final bool skipLoadingOnRefresh;

  /// Whether to skip error state. Defaults to false
  final bool skipError;

  bool _isEmpty(T data) {
    if (data == null) return true;
    if (data is List) return data.isEmpty;
    if (data is Map) return data.isEmpty;
    if (data is String) return data.isEmpty;
    if (data is Iterable) return data.isEmpty;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (T data) {
        if (_isEmpty(data) && empty != null) {
          return empty!();
        }
        return this.data(data);
      },
      error: (error, stackTrace) {
        if (skipError) {
          return const SizedBox.shrink();
        }
        if (this.error != null) {
          return this.error!(error, stackTrace, onRetry);
        }
        return DefaultErrorWidget(
          error: error,
          stackTrace: stackTrace,
          onRetry: onRetry,
        );
      },
      loading: () => loading ?? const DefaultLoadingWidget(),
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
    );
  }
}

/// Default loading widget with centered circular progress indicator
class DefaultLoadingWidget extends StatelessWidget {
  const DefaultLoadingWidget({
    this.color,
    super.key,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

/// Default error widget with icon, message and retry button
class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    required this.error,
    this.stackTrace,
    this.onRetry,
    super.key,
  });

  final Object error;
  final StackTrace? stackTrace;
  final Future<void> Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => onRetry!(),
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}

/// Empty state widget with custom icon and message
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    required this.message,
    this.icon = Icons.inbox_outlined,
    super.key,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: Theme.of(context).disabledColor,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Shimmer loading effect widget
class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({
    required this.child,
    this.baseColor,
    this.highlightColor,
    super.key,
  });

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    // Note: To use Shimmer, you need to add the shimmer package to pubspec.yaml
    // For now, we'll return a simple container with animation
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            baseColor ?? Colors.grey[300]!,
            highlightColor ?? Colors.grey[100]!,
            baseColor ?? Colors.grey[300]!,
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: const Alignment(-1.0, -0.3),
          end: const Alignment(1.0, 0.3),
          tileMode: TileMode.clamp,
        ),
      ),
      child: child,
    );
  }
}
