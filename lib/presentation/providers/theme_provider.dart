import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkMode = StateProvider<bool>((ref) => false);
final selectedColor = Provider((ref) => colors);
final indexColor = StateProvider<int>((ref) => 0);

// un objeto de tipo appTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme(selectedColor: 0));

  void toggleDarkMode() {
    state = state.copyWith(darkMode: !state.darkMode);
  }

  void selectColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
