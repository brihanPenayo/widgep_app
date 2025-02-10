import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const String name = 'theme_changer';
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(selectedColor);
    final bool isDark = ref.watch(themeNotifierProvider).darkMode;
    final colorIndex = ref.watch(themeNotifierProvider).selectedColor;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Changer Screen'),
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                },
                icon: isDark
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode))
          ],
        ),
        body: ListView.builder(
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final color = colors[index];
              return RadioListTile(
                  activeColor: color,
                  title: Text(
                    'Este color',
                    style: TextStyle(color: color),
                  ),
                  subtitle: Text(
                      '#${color.toString().split('(0xff')[1].split(')')[0].toUpperCase()}'),
                  value: index,
                  groupValue: colorIndex,
                  onChanged: (value) {
                    ref
                        .read(themeNotifierProvider.notifier)
                        .selectColor(value!);
                  });
            }));
  }
}
