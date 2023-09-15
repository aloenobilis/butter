import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_subtitle.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FlutterAnimation extends StatefulWidget {
  static const id = 'flutter_animation';

  @override
  State<FlutterAnimation> createState() => _FlutterAnimationState();
}

class _FlutterAnimationState extends State<FlutterAnimation> {
  bool selectedAnimatedContainer = false;
  bool selectedAnimatedAlign = false;
  double opacityLevel = 1.0;
  double padValue = 10.0;
  bool selectedAnimatedPositioned = false;
  double _size = 50.0;
  bool _large = false;

  ResponsiveGridCol animatedContainer() {
    return ResponsiveGridCol(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(
                () => selectedAnimatedContainer = !selectedAnimatedContainer);
          },
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin:
                  EdgeInsets.only(top: selectedAnimatedContainer ? 100 : 25),
              child: const FlutterLogo(
                size: 60,
              )),
        ),
      ),
    );
  }

  ResponsiveGridCol animatedAlign() {
    return ResponsiveGridCol(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedAnimatedAlign = !selectedAnimatedAlign;
            });
          },
          child: Center(
            child: SizedBox(
              width: 250.0,
              height: 100.0,
              child: AnimatedAlign(
                alignment: selectedAnimatedAlign
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut, // .fastOutSlowIn,
                child: const FlutterLogo(size: 60.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ResponsiveGridCol animatedOpacity() {
    return ResponsiveGridCol(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 1),
            child: const FlutterLogo(
              size: 60,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
            },
            child: const Text('Fade Logo'),
          ),
        ],
      ),
    );
  }

  ResponsiveGridCol animatedPadding() {
    return ResponsiveGridCol(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: const Duration(seconds: 2),
            curve: Curves.bounceOut,
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 6,
              color: Colors.blue,
            ),
          ),
          Text('Padding: $padValue'),
          ElevatedButton(
              child: const Text('Change padding'),
              onPressed: () {
                padValue == 10.0
                    ? setState(() => padValue = 100.0)
                    : setState(() => padValue = 10.0);
              }),
        ],
      ),
    );
  }

  ResponsiveGridCol animatedPositioned() {
    return ResponsiveGridCol(
      child: Center(
        child: SizedBox(
          width: 200,
          height: 350,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                width: selectedAnimatedPositioned ? 200.0 : 50.0,
                height: selectedAnimatedPositioned ? 50.0 : 200.0,
                top: selectedAnimatedPositioned ? 50.0 : 150.0,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnimatedPositioned = !selectedAnimatedPositioned;
                    });
                  },
                  child: const ColoredBox(
                    color: Colors.blue,
                    child: Center(child: Text('Tap me')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ResponsiveGridCol animatedSize() {
    return ResponsiveGridCol(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _size = _large ? 250.0 : 100.0;
              _large = !_large;
            });
          },
          child: ColoredBox(
            color: Colors.amberAccent,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              child: FlutterLogo(size: _size),
            ),
          ),
        ),
      ),
    );
  }

  final codeContainer = '''
bool selectedAnimatedContainer = false;
Center(
  child: GestureDetector(
    onTap: () {
      setState(
          () => selectedAnimatedContainer = !selectedAnimatedContainer);
    },
    child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin:
            EdgeInsets.only(top: selectedAnimatedContainer ? 100 : 25),
        child: const FlutterLogo(
          size: 60,
        )),
  ),
),
''';

  final codeAlign = '''
bool selectedAnimatedAlign = false;
Center(
  child: GestureDetector(
    onTap: () {
      setState(() {
        selectedAnimatedAlign = !selectedAnimatedAlign;
      });
    },
    child: Center(
      child: SizedBox(
        width: 250.0,
        height: 250.0,
        child: AnimatedAlign(
          alignment: selectedAnimatedAlign
              ? Alignment.centerRight
              : Alignment.centerLeft,
          duration: const Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut, // .fastOutSlowIn,
          child: const FlutterLogo(size: 60.0),
        ),
      ),
    ),
  ),
),
''';

  final codeOpacity = '''
double opacityLevel = 1.0;
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(seconds: 1),
      child: const FlutterLogo(
        size: 60,
      ),
    ),
    ElevatedButton(
      onPressed: () {
        setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
      },
      child: const Text('Fade Logo'),
    ),
  ],
),
''';

  final codePadding = '''
double padValue = 10.0;
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    AnimatedPadding(
      padding: EdgeInsets.all(padValue),
      duration: const Duration(seconds: 2),
      curve: Curves.bounceOut,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 6,
        color: Colors.blue,
      ),
    ),
    Text('Padding: \$padValue'),
    ElevatedButton(
        child: const Text('Change padding'),
        onPressed: () {
          padValue == 10.0
              ? setState(() => padValue = 100.0)
              : setState(() => padValue = 10.0);
        }),
  ],
),
''';

  final codePositioned = '''
bool selectedAnimatedPositioned = false;
SizedBox(
  width: 200,
  height: 350,
  child: Stack(
    children: <Widget>[
      AnimatedPositioned(
        width: selectedAnimatedPositioned ? 200.0 : 50.0,
        height: selectedAnimatedPositioned ? 50.0 : 200.0,
        top: selectedAnimatedPositioned ? 50.0 : 150.0,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedAnimatedPositioned = !selectedAnimatedPositioned;
            });
          },
          child: const ColoredBox(
            color: Colors.blue,
            child: Center(child: Text('Tap me')),
          ),
        ),
      ),
    ],
  ),
),
''';

  final codeSize = '''
double _size = 50.0;
bool _large = false;
Center(
  child: GestureDetector(
    onTap: () {
      setState(() {
        _size = _large ? 250.0 : 100.0;
        _large = !_large;
      });
    },
    child: ColoredBox(
      color: Colors.amberAccent,
      child: AnimatedSize(
        curve: Curves.easeIn,
        duration: const Duration(seconds: 1),
        child: FlutterLogo(size: _size),
      ),
    ),
  ),
),
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Flutter: Animation"),
      body: SingleChildScrollView(
          child: ResponsiveGridRow(
        children: [
          cardTitle("Animation"),
          cardSubtitle("Animated Container"),
          kpadding(),
          ktext(
              "Animated version of Container that gradually changes its values over a period of time."),
          kpadding(),
          codeItemGridCol(codeContainer),
          animatedContainer(),
          kpadding(),
          cardSubtitle("Animated Align"),
          kpadding(),
          ktext(
              """Animated version of Align which automatically transitions the child's position over a given duration whenever the given alignment changes."""),
          kpadding(),
          codeItemGridCol(codeAlign),
          animatedAlign(),
          cardSubtitle("Animated Opacity"),
          kpadding(),
          ktext(
              """Animated version of Opacity which automatically transitions the child's opacity over a given duration whenever the given opacity changes."""),
          kpadding(),
          codeItemGridCol(codeOpacity),
          animatedOpacity(),
          kpadding(),
          cardSubtitle("Animated Padding"),
          kpadding(),
          ktext(
              """Animated version of Padding which automatically transitions the indentation over a given duration whenever the given inset changes."""),
          kpadding(),
          codeItemGridCol(codePadding),
          animatedPadding(),
          kpadding(),
          cardSubtitle("Animated Positioned"),
          kpadding(),
          ktext(
              """Animated version of Positioned which automatically transitions the child's position over a given duration whenever the given position changes."""),
          kpadding(),
          codeItemGridCol(codePositioned),
          animatedPositioned(),
          kpadding(),
          cardSubtitle("Animated Size"),
          kpadding(),
          ktext(
              "Animated widget that automatically transitions its size over a given duration whenever the given child's size changes."),
          kpadding(),
          codeItemGridCol(codeSize),
          kpadding(),
          animatedSize(),
          kpadding(),
          kpadding(),
          kpadding(),
          kpadding(),
        ],
      )),
    );
  }
}
