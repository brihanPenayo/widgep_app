import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkMode = StateProvider<bool>((ref) => false);
final selectedColor = Provider((ref) => colors);
final indexColor = StateProvider<int>((ref) => 0);
