import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cards = [
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
  },
  {
    'elevation': 1.0,
    'label': 'Elevation 1',
  },
  {
    'elevation': 2.0,
    'label': 'Elevation 2',
  },
  {
    'elevation': 3.0,
    'label': 'Elevation 3',
  },
  {
    'elevation': 4.0,
    'label': 'Elevation 4',
  },
  {
    'elevation': 5.0,
    'label': 'Elevation 5',
  }
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards-screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardType1(
                elevation: card['elevation'],
                label: card['label'],
              )),
          ...cards.map((card) => _CardType2(
                elevation: card['elevation'],
                label: card['label'],
              )),
          ...cards.map((card) => _CardType3(
                elevation: card['elevation'],
                label: card['label'],
              )),
          ...cards.map((card) => _CardType4(
                elevation: card['elevation'],
                label: card['label'],
              )),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double elevation;
  final String label;
  const _CardType1({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.zoom_out_map,
                  )),
            ),
            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final double elevation;
  final String label;
  const _CardType2({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.secondary, width: 2),
          borderRadius: BorderRadius.circular(10)),
      color: colors.primary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      iconColor: MaterialStatePropertyAll(colors.onPrimary)),
                  icon: const Icon(
                    Icons.more_vert_sharp,
                  )),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text(label, style: TextStyle(color: colors.onPrimary))),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final double elevation;
  final String label;
  const _CardType3({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: colors.primary, width: 2)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_sharp,
                  )),
            ),
            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final double elevation;
  final String label;
  const _CardType4({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: colors.primary, width: 2)),
      child: Stack(
        children: [
          Image.network('http://picsum.photos/id/${elevation.toInt()}/600/250'),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(10))),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_sharp,
                    color: colors.onPrimary,
                  )),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(label,
                      style: TextStyle(color: colors.onPrimary, shadows: const [
                        Shadow(color: Colors.black, blurRadius: 10)
                      ])))),
        ],
      ),
    );
  }
}
