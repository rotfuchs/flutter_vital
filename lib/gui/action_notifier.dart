import 'package:flutter/cupertino.dart';

class ActionNotifier {
  static ValueNotifier<String> _notifier = ValueNotifier("");

  static void setAction(String action) {
    _notifier.value = action;
  }

  static void addListener(Function() listener) {
    _notifier.addListener(listener);
  }

  static String get value => _notifier.value;
}