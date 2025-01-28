import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 200;
  double height = 200;
  Color colorAux = Colors.indigo;
  double radius = 10;

  void changeShape() {
    final Random random = Random();
    int red = random.nextInt(255);
    int blue = random.nextInt(255);
    int green = random.nextInt(255);

    width = random.nextInt(300) + 30;
    height = random.nextInt(300) + 30;
    colorAux = Color.fromRGBO(red, green, blue, 1);
    radius = random.nextInt(100) + 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
        width: width < 0 ? 0 : width,
        height: height < 0 ? 0 : height,
        decoration: BoxDecoration(
          color: colorAux,
          borderRadius: BorderRadius.circular(radius < 0 ? 0 : radius),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
