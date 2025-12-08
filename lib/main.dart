import "package:a_better_color_changer_3_2/providers/theme_notifier.dart";
import "package:a_better_color_changer_3_2/screens/home.dart";
import "package:a_better_color_changer_3_2/screens/settings.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeNotifierProvider);

    final router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          redirect: (BuildContext context, GoRouterState state) => "/home",
        ),
        GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: "/settings",
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    );

    final lightScheme = ColorScheme.fromSeed(
      seedColor: themeState.seedColor,
    );
    final darkScheme = ColorScheme.fromSeed(
      seedColor: themeState.seedColor,
      brightness: Brightness.dark,
    );

    return MaterialApp.router(
      title: "Project 3.2: A Better Color changer",
      theme: ThemeData(
        colorScheme: lightScheme,
        scaffoldBackgroundColor: lightScheme.surface,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkScheme,
        scaffoldBackgroundColor: darkScheme.surface,
        useMaterial3: true,
      ),
      themeMode: themeState.brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      routerConfig: router,
    );
  }
}
