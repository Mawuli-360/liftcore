import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider to access keyboard visibility state
final keyboardVisibilityProvider = StateProvider<bool>((ref) => false);

/// Provider to access keyboard height
final keyboardHeightProvider = StateProvider<double>((ref) => 0.0);

/// A widget that manages keyboard visibility and provides keyboard information
class KeyboardVisibilityManager extends ConsumerStatefulWidget {
  final Widget child;

  const KeyboardVisibilityManager({
    required this.child,
    super.key,
  });

  /// Dismiss the keyboard if it's visible
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  ConsumerState<KeyboardVisibilityManager> createState() =>
      _KeyboardVisibilityManagerState();
}

class _KeyboardVisibilityManagerState
    extends ConsumerState<KeyboardVisibilityManager>
    with WidgetsBindingObserver {
  final _keyboardVisibilityController = KeyboardVisibilityController();
  late final StreamSubscription<bool> _keyboardSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initKeyboardListener();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _keyboardSubscription.cancel();
    super.dispose();
  }

  void _initKeyboardListener() {
    // Set initial keyboard visibility state
    ref.read(keyboardVisibilityProvider.notifier).state =
        _keyboardVisibilityController.isVisible;

    // Listen to keyboard visibility changes
    _keyboardSubscription =
        _keyboardVisibilityController.onChange.listen((bool visible) {
      ref.read(keyboardVisibilityProvider.notifier).state = visible;
      if (visible) {
        _updateKeyboardHeight();
      } else {
        ref.read(keyboardHeightProvider.notifier).state = 0.0;
      }
      _onKeyboardVisibilityChanged(visible);
    });
  }

  void _updateKeyboardHeight() {
    final viewInsets = MediaQuery.of(context).viewInsets;
    final keyboardHeight = viewInsets.bottom;
    ref.read(keyboardHeightProvider.notifier).state = keyboardHeight;
  }

  void _onKeyboardVisibilityChanged(bool isVisible) {
    debugPrint(
        'Keyboard visibility changed: ${isVisible ? 'Shown' : 'Hidden'}');
    if (isVisible) {
      debugPrint('Keyboard height: ${ref.read(keyboardHeightProvider)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: widget.child,
    );
  }
}

/// Extension methods for keyboard management
extension KeyboardManagerExtension on BuildContext {
  /// Check if keyboard is visible
  bool get isKeyboardVisible =>
      KeyboardVisibilityProvider.isKeyboardVisible(this);

  /// Get current keyboard height
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Dismiss keyboard
  void dismissKeyboard() {
    KeyboardVisibilityManager.dismissKeyboard(this);
  }
}
