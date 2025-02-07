import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final bool isDark = ref.watch(isDarkMode);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen',
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkMode.notifier).state = !isDark;
              },
              icon: isDark
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode))
        ],
      ),
      body: Center(
        child: Text('Count value: $counter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
