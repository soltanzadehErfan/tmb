import 'package:flutter/material.dart';

/// A [SafeProvider] class that extends [ChangeNotifier] to safely notify listeners and handle disposal.
///
/// This class ensures that listeners are only notified if the provider has not been disposed,
/// preventing potential issues that arise from trying to notify listeners after disposal.
class SafeProvider extends ChangeNotifier {
  bool _isDisposed = false;

  /// Overrides the [notifyListeners] method to ensure it only notifies listeners
  /// if the provider has not been disposed.
  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  /// Overrides the [dispose] method to mark the provider as disposed and
  /// then calls the superclass's dispose method.
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
