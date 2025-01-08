import 'package:flutter/material.dart';
import 'package:widgep_app/config/theme/apptheme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).getTheme(),
      home: Scaffold(
        body: SizedBox.expand(
            child: DecoratedBox(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
        )),
      ),
    );
  }
}
