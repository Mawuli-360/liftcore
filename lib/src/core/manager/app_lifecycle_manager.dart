import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Enum representing the current state of the app lifecycle
enum CustomAppLifecycleState {
  /// App is visible and responding to user input
  resumed,

  /// App is not currently visible, running in the background
  paused,

  /// App is in an inactive state, not receiving user input
  inactive,

  /// App is in a detached state (terminated but instance exists)
  detached,
}

/// Provider to access the current app lifecycle state
final appLifecycleProvider = StateProvider<CustomAppLifecycleState>(
  (ref) => CustomAppLifecycleState.resumed,
);

/// A widget that manages the application lifecycle
class AppLifecycleManager extends ConsumerStatefulWidget {
  final Widget child;

  const AppLifecycleManager({
    required this.child,
    super.key,
  });

  @override
  ConsumerState<AppLifecycleManager> createState() =>
      _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends ConsumerState<AppLifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Convert Flutter's AppLifecycleState to our custom AppLifecycleState
    final appState = switch (state) {
      AppLifecycleState.resumed => CustomAppLifecycleState.resumed,
      AppLifecycleState.inactive => CustomAppLifecycleState.inactive,
      AppLifecycleState.paused => CustomAppLifecycleState.paused,
      AppLifecycleState.detached => CustomAppLifecycleState.detached,
      AppLifecycleState.hidden =>
        CustomAppLifecycleState.inactive, // Map hidden to inactive
    };

    // Update the app lifecycle state
    ref.read(appLifecycleProvider.notifier).state = appState;

    _handleLifecycleChange(appState);
  }

  void _handleLifecycleChange(CustomAppLifecycleState state) {
    switch (state) {
      case CustomAppLifecycleState.resumed:
        _onAppResumed();
      case CustomAppLifecycleState.paused:
        _onAppPaused();
      case CustomAppLifecycleState.inactive:
        _onAppInactive();
      case CustomAppLifecycleState.detached:
        _onAppDetached();
    }
  }

  void _onAppResumed() {
    debugPrint('App Resumed: App is visible and responding to user input');
    // TODO: Implement resume logic
    // - Refresh data
    // - Reconnect to services
    // - Resume animations
    // - Resume background tasks
  }

  void _onAppPaused() {
    debugPrint('App Paused: App is not currently visible');
    // TODO: Implement pause logic
    // - Save app state
    // - Pause animations
    // - Stop background tasks
    // - Release resources
  }

  void _onAppInactive() {
    debugPrint('App Inactive: App is not receiving user input');
    // TODO: Implement inactive logic
    // - Save current state
    // - Pause sensitive operations
    // - Handle security requirements
  }

  void _onAppDetached() {
    debugPrint('App Detached: App is terminated but instance exists');
    // TODO: Implement detached logic
    // - Save critical data
    // - Clean up resources
    // - Perform cleanup operations
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
