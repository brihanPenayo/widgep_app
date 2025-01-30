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

enum Transportation { car, bus, plane, bike, boat }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transportation selected = Transportation.car;
  final List<Map<String, dynamic>> options = [
    {'value': Transportation.car, 'title': 'Car', 'subTitle': 'by car'},
    {'value': Transportation.bus, 'title': 'Bus', 'subTitle': 'by bus'},
    {'value': Transportation.plane, 'title': 'Plane', 'subTitle': 'by plane'},
    {'value': Transportation.bike, 'title': 'Bike', 'subTitle': 'by bike'},
    {'value': Transportation.boat, 'title': 'Boat', 'subTitle': 'by boat'},
  ];
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
      ExpansionTile(
        title: const Text('Transportations'),
        subtitle: Text('Selected: ${selected.name.toUpperCase()}'),
        children: [
          ...options.map((e) => _TransportationListTile(
              value: e['value'],
              title: e['title'],
              subtitle: e['subTitle'],
              groupValue: selected,
              onChanged: (v) {
                setState(() {
                  selected = e['value'];
                });
              })),
        ],
      )
    ]);
  }
}

class _TransportationListTile extends StatelessWidget {
  final Transportation value;
  final String title;
  final String subtitle;
  final Transportation groupValue;
  final ValueChanged<Transportation?> onChanged;
  const _TransportationListTile(
      {required this.value,
      required this.title,
      required this.subtitle,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subtitle),
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
