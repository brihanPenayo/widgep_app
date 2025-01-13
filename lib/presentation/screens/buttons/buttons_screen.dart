import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons-screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons Screen'),
        ),
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.chevron_left),
          onPressed: () {
            context.go('/');
          },
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm),
                label: const Text('Elevated with icons')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            const FilledButton(onPressed: null, child: Text('Filled disabled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Filled icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Outlined icon')),
            const OutlinedButton(
                onPressed: null, child: Text('Outlined disabled')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Text icon')),
            const TextButton(onPressed: null, child: Text('Text disabled')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.access_alarm)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm, color: Colors.white),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(color.primary))),
            const CustomButton(text: 'Custom Button'),
          ],
          //TODO: hacer un custom button
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Material(
      color: color.primary,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Text(text, style: TextStyle(color: color.onPrimary)),
        ),
      ),
    );
  }
}
