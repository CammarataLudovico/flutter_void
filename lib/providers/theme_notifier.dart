import "dart:math";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ThemeState {
  const ThemeState({required this.brightness, required this.seedColor});
  final Brightness brightness;
  final Color seedColor;
}

class ThemeNotifier extends Notifier<ThemeState> {
  @override
  ThemeState build() {
    return const ThemeState(
      brightness: Brightness.light,
      seedColor: Colors.deepPurple,
    );
  }

  void toggleBrightness() {
    state = ThemeState(
      brightness: state.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      seedColor: state.seedColor,
    );
  }

  void setColor(Color color) {
    state = ThemeState(brightness: state.brightness, seedColor: color);
  }

  void randomizeColor() {
    final rnd = Random();
    final color = Colors.primaries[rnd.nextInt(Colors.primaries.length)];
    state = ThemeState(brightness: state.brightness, seedColor: color);
  }
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeState>(
  ThemeNotifier.new,
);
