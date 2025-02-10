import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDark = ref.watch(isDarkMode);
    // final colorIndex = ref.watch(indexColor);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    // final theme = AppTheme(selectedColor: colorIndex, darkMode: isDark).theme();
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme(),
    );
  }
}
