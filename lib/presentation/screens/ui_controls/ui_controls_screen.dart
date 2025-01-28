import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ui Controls Screen')),
        body: const _UiControlsView());
  }
}

enum Transportation { car, bus, plane, bike }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transportation selected = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Show details'),
          value: isDeveloperMode,
          onChanged: (v) {
            setState(() {
              isDeveloperMode = !isDeveloperMode;
            });
          }),
      RadioListTile(
          value: Transportation.car,
          title: const Text('Car'),
          subtitle: const Text('By car'),
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = Transportation.car;
            });
          }),
      RadioListTile(
          value: Transportation.bike,
          title: const Text('Bike'),
          subtitle: const Text('By bike'),
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = Transportation.bike;
            });
          }),
      RadioListTile(
          value: Transportation.bus,
          title: const Text('Bus'),
          subtitle: const Text('By bus'),
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = Transportation.bus;
            });
          }),
      RadioListTile(
          value: Transportation.plane,
          title: const Text('Plane'),
          subtitle: const Text('By plane'),
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = Transportation.plane;
            });
          }),
    ]);
  }
}
