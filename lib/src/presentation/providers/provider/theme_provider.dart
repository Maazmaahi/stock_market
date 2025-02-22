import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  static final _storage = StorageManger();

  Future<void> _loadTheme() async {
    final theme = await _storage.getTheme();
    if (theme == 'light') {
      state = ThemeMode.light;
    } else if (theme == 'dark') {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.system;
    }
  }

  Future<void> toggleTheme(ThemeMode mode) async {
    state = mode;
    await _storage.storeTheme(mode.toString().split('.').last);
  }
}
