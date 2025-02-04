import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> images = [0, 1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 250 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  void addFive() {
    final lastImage = images.last;
    images.addAll([1, 2, 3, 4, 5].map((e) => e + lastImage));
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    addFive();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    scrollController.animateTo(scrollController.position.pixels + 200,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    isMounted = false;
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    isLoading = false;
    final lastId = images.last;
    images.clear();
    images.add(lastId + 1);
    addFive();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
                itemCount: images.length,
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(children: [
                    FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 350),
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                        placeholder:
                            const AssetImage('assets/images/jar-loading.gif'),
                        image: NetworkImage(
                            'https://picsum.photos/id/${images[index]}/500/300')),
                    const SizedBox(height: 10),
                  ]);
                }),
          ),
        ),
        isLoading
            ? Positioned(
                bottom: 20,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: SpinPerfect(
                  child: Icon(Icons.refresh_rounded,
                      size: 40,
                      color:
                          Color(Theme.of(context).colorScheme.primary.value)),
                )))
            : const SizedBox()
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}
