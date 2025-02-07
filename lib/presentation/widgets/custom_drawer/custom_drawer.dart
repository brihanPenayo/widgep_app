import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menuItems/menu_items.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class CustomDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomDrawer({super.key, required this.scaffoldKey});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 30;
    return NavigationDrawer(
      onDestinationSelected: (int index) {
        setState(() {
          selectedOptionIndex = index;
        });
        context.push(appMenuItems[index].link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      selectedIndex: selectedOptionIndex,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 30, vertical: hasNotch ? 20 : 10),
          child: const Text(
            'Menu',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ...appMenuItems.sublist(0, 4).map(
              (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title)),
            ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 30, vertical: hasNotch ? 20 : 10),
          child: const Text(
            'More Options',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ...appMenuItems.sublist(4).map(
              (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title)),
            ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(),
        ),
        Consumer(builder: (context, ref, child) {
          final isDark = ref.watch(isDarkMode);
          return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: isDark,
                  onChanged: (value) {
                    ref.read(isDarkMode.notifier).state = value;
                  }));
        })
      ],
    );
  }
}
