import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca lo que quieras',
      caption: 'Encuentra tu comida favorita',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption: 'Disfruta tu comida favorita a tiempo',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta en tu casa',
      caption: 'Disfruta tu comida favorita en tu casa, en cualquier momento',
      imageUrl: 'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: _AppTutorialView(),
    );
  }
}

class _AppTutorialView extends StatefulWidget {
  const _AppTutorialView();

  @override
  State<_AppTutorialView> createState() => _AppTutorialViewState();
}

class _AppTutorialViewState extends State<_AppTutorialView> {
  final PageController _pageController = PageController(initialPage: 0);
  bool showButton = false;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
      if (!showButton && page >= (slides.length - 1.5)) {
        setState(() {
          showButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          physics: const BouncingScrollPhysics(),
          controller: _pageController,
          children: [...slides.map((slide) => _Slide(slide: slide))],
        ),
        Positioned(
            right: 20,
            top: 40,
            child: TextButton(
                onPressed: () => context.pop(),
                child: const Text(
                  'Salir',
                  style: TextStyle(fontSize: 18),
                ))),
        showButton
            ? Positioned(
                bottom: 20,
                left: (MediaQuery.of(context).size.width - 100) / 2,
                child: FadeInUp(
                  duration: const Duration(milliseconds: 350),
                  delay: const Duration(milliseconds: 600),
                  child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Finalizar')),
                ))
            : const SizedBox(),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slide;
  const _Slide({
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Image.asset(slide.imageUrl),
            const SizedBox(height: 20),
            Text(slide.title, style: textStyle),
            const SizedBox(height: 10),
            Text(slide.caption, style: captionStyle),
          ])),
    );
  }
}
