import 'package:flutter/material.dart';
import 'package:widgep_app/config/router/app_router.dart';
import 'package:widgep_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(selectedColor: 5).theme();
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
