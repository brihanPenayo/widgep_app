import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedOptionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (int index) {
        setState(() {
          selectedOptionIndex = index;
        });
      },
      selectedIndex: selectedOptionIndex,
      children: const [
        NavigationDrawerDestination(
            icon: Icon(Icons.access_alarm), label: Text('Alarm')),
        NavigationDrawerDestination(
            icon: Icon(Icons.access_alarm), label: Text('Alarm')),
      ],
    );
  }
}
