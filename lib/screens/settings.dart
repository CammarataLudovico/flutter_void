import "package:a_better_color_changer_3_2/providers/theme_notifier.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const List<MaterialColor> availableColors = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.deepOrange,
    Colors.red,
  ];

  String _labelFor(Color c) {
    if (c == Colors.blue) return "Blue";
    if (c == Colors.green) return "Green";
    if (c == Colors.purple) return "Purple";
    if (c == Colors.deepOrange) return "Orange";
    if (c == Colors.red) return "Red";
    return c.toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeNotifierProvider);
    final notifier = ref.read(themeNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("3.2 A Better Color Changer - Settings"),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Dark mode"),
              value: themeState.brightness == Brightness.dark,
              onChanged: (_) => notifier.toggleBrightness(),
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Base color"),
            ),
            const SizedBox(height: 8),
            ...availableColors.map((c) {
              return RadioListTile<Color>(
                title: Text(_labelFor(c)),
                value: c,
                groupValue: themeState.seedColor,
                onChanged: (col) {
                  if (col != null) notifier.setColor(col);
                },
                secondary: CircleAvatar(backgroundColor: c),
              );
            }),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: notifier.randomizeColor,
              icon: const Icon(Icons.shuffle),
              label: const Text("Randomize color"),
            ),
          ],
        ),
      ),
    );
  }
}
