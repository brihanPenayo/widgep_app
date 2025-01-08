import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String link;
  final String subTitle;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.link,
      required this.subTitle,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Prueba',
      link: '/buttons',
      subTitle: 'Varios botones en flutter',
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Test',
      link: '/test',
      subTitle: 'Un test en flutter',
      icon: Icons.textsms),
  MenuItems(
      title: 'Cards',
      link: '/cards',
      subTitle: 'Tarjetas en flutter',
      icon: Icons.credit_card_outlined),
  MenuItems(
      title: 'Inputs',
      link: '/inputs',
      subTitle: 'Inputs en flutter',
      icon: Icons.input_outlined),
  MenuItems(
      title: 'Alerts',
      link: '/alerts',
      subTitle: 'Alertas en flutter',
      icon: Icons.warning_amber_outlined)
];
