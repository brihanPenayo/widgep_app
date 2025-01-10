import 'package:flutter/material.dart';
import 'package:widgep_app/config/theme/app_theme.dart';
import 'package:widgep_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgep_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgep_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(selectedColor: 5).theme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
