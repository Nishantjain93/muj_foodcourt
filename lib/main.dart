import 'package:flutter/material.dart'
    show
        AnimatedBuilder,
        Animation,
        AnimationController,
        AppBar,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Center,
        Color,
        ColorTween,
        Colors,
        Container,
        EdgeInsets,
        FontWeight,
        GestureDetector,
        GridView,
        MaterialApp,
        Offset,
        Scaffold,
        SingleTickerProviderStateMixin,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Tween,
        Widget,
        runApp;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid of Boxes',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<String> boxTexts = [
    'Cheffie Ab-1',
    'Dom Central canteen',
    'Dom Icecream Corner',
    'Old mess Ground floor Campus coffie',
    'Old mess Ground floor Coffie shop',
    'Old mess 1st floor Juice shop',
    'Old mess 1st floor Juice shop',
    'Old mess 1st floor Juice shop',
    'Old mess 1st floor Juice shop',
    'Ab2 foodcourt',
    'Ab2 foodcourt',
    'Ab2 foodcourt',
    'Ab2 foodcourt',
    'Ab2 foodcourt',
  ];

  List<Color> boxColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  int selectedBoxIndex = 0;

  void onBoxTap(int index) {
    setState(() {
      selectedBoxIndex = index;
      _controller.forward(from: 0.0);
    });

    launchUrl(index);
  }

  Future<void> launchUrl(int index) async {
    final urls = [
      'https://www.google.com',
      'https://example.com/2',
      'https://example.com/3',
      'https://example.com/4',
      'https://example.com/5',
      'https://example.com/6',
      'https://example.com/7',
      'https://example.com/8',
      'https://example.com/9',
      'https://example.com/10',
      'https://example.com/11',
      'https://example.com/12',
      'https://example.com/13',
      'https://example.com/14',
    ];

    final url = urls[index];

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _colorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.grey[300])
            .animate(_controller);
    _sizeAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Muj_FoodCourt'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(14, (index) {
          return GestureDetector(
            onTap: () => onBoxTap(index),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  height: 100 * _sizeAnimation.value,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedBoxIndex == index
                        ? _colorAnimation.value
                        : boxColors[index % boxColors.length],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      boxTexts[index],
                      textAlign: TextAlign.center, // add this line
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedBoxIndex == index
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

void onBoxTap(int index) async {
  final urls = [
    'https://www.google.com',
    'https://example.com/2',
    'https://example.com/3',
    'https://example.com/4',
    'https://example.com/5',
    'https://example.com/6',
    'https://example.com/7',
    'https://example.com/8',
    'https://example.com/9',
    'https://example.com/10',
    'https://example.com/11',
    'https://example.com/12',
    'https://example.com/13',
    'https://example.com/14',
  ];

  final url = urls[index];

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
