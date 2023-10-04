import 'dart:ui';
import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/circle.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_subtitle.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ++++++++++++++++++++++++++++++++++++++++++++++++
// Item Picker
// ++++++++++++++++++++++++++++++++++++++++++++++++
/*
This animation was achieved using only AnimatedContainer, AnimatedPositioned,
and AnimatedDefaultTextStyle widgets. 
*/
class ItemPicker extends StatefulWidget {
  const ItemPicker({
    Key? key,
    required this.containerHeight,
  }) : super(key: key);

  final double containerHeight;

  @override
  State<ItemPicker> createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double listContainerBorderWidth = 1.5;
    const int itemsCount = 5;
    double itemHeight =
        (widget.containerHeight - listContainerBorderWidth * 2) / itemsCount;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: selectedItemIndex * itemHeight,
            left: 0,
            right: 0,
            height: itemHeight,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                itemsCount,
                (i) => Expanded(
                  child: InkWell(
                    onTap: () => setState(() => selectedItemIndex = i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'List Item ${i + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            if (i == 3)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: selectedItemIndex == i
                                      ? Colors.yellow
                                      : Colors.pink,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: selectedItemIndex == i
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: selectedItemIndex == i
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  child: const Text('Featured!'),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ++++++++++++++++++++++++++++++++++++++++++++++++
// Blur Slider
// ++++++++++++++++++++++++++++++++++++++++++++++++
/*
The TweenAnimationBuilder allows you to implicitly animate any property of any
widget using a Tween class. The Tween class takes its name from “Between”.
It basically gives you a begin and end values to animate between.
*/
class BlurSlider extends StatefulWidget {
  const BlurSlider({Key? key}) : super(key: key);

  @override
  State<BlurSlider> createState() => _BlurSliderState();
}

class _BlurSliderState extends State<BlurSlider> {
  double _sliderValue = 0.01;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0.01, end: _sliderValue),
      child: Container(
        height: 300,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        alignment: Alignment.center,
        child: Slider(
          value: _sliderValue,
          min: 0.01,
          onChanged: (value) {
            setState(() => _sliderValue = value);
          },
        ),
      ),
      builder: (BuildContext context, double? value, Widget? child) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40 * (value ?? 0.01),
              sigmaY: 40 * (value ?? 0.01),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

// ++++++++++++++++++++++++++++++++++++++++++++++++
// Explicit Animations
// ++++++++++++++++++++++++++++++++++++++++++++++++
/*

*/

class Rectangle extends StatelessWidget {
  const Rectangle({
    Key? key,
    this.width = 60,
    this.height = 40,
    required this.color1,
    required this.color2,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color1;
  final Color color2;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 1, color: Colors.black54),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AlignTransition(
        alignment: _alignAnimation,
        child: RotationTransition(
          turns: _rotationAnimation,
          child: const Rectangle(
            color1: Colors.orangeAccent,
            color2: Colors.deepOrange,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}

// ++++++++++++++++++++++++++++++++++++++++++++++++
// Explicit Animations - AnimatedBuilder
// ++++++++++++++++++++++++++++++++++++++++++++++++
/*
*/
class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.yellowAccent,
                Colors.orange,
                Colors.redAccent
              ],
              stops: [0, _controller.value, 1],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
          ),
        );
      },
    );
  }
}

class FlutterAnimation2 extends StatefulWidget {
  static const id = 'flutter_animation_2';
  const FlutterAnimation2({super.key});

  @override
  State<FlutterAnimation2> createState() => _FlutterAnimation2State();
}

class _FlutterAnimation2State extends State<FlutterAnimation2> {
  bool selectedAnimatedContainer = false;

  final codeItemPicker = '''
class ItemPicker extends StatefulWidget {
  const ItemPicker({
    Key? key,
    required this.containerHeight,
  }) : super(key: key);

  final double containerHeight;

  @override
  State<ItemPicker> createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double listContainerBorderWidth = 1.5;
    const int itemsCount = 5;
    double itemHeight =
        (widget.containerHeight - listContainerBorderWidth * 2) / itemsCount;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: selectedItemIndex * itemHeight,
            left: 0,
            right: 0,
            height: itemHeight,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                itemsCount,
                (i) => Expanded(
                  child: InkWell(
                    onTap: () => setState(() => selectedItemIndex = i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'List Item \${i + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            if (i == 3)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: selectedItemIndex == i
                                      ? Colors.yellow
                                      : Colors.pink,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: selectedItemIndex == i
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: selectedItemIndex == i
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  child: const Text('Featured!'),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
''';

  final codeBlurSlider = '''
class BlurSlider extends StatefulWidget {
  const BlurSlider({Key? key}) : super(key: key);

  @override
  State<BlurSlider> createState() => _BlurSliderState();
}

class _BlurSliderState extends State<BlurSlider> {
  double _sliderValue = 0.01;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0.01, end: _sliderValue),
      child: Container(
        height: 300,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        alignment: Alignment.center,
        child: Slider(
          value: _sliderValue,
          min: 0.01,
          onChanged: (value) {
            setState(() => _sliderValue = value);
          },
        ),
      ),
      builder: (BuildContext context, double? value, Widget? child) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40 * (value ?? 0.01),
              sigmaY: 40 * (value ?? 0.01),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class Circle extends StatelessWidget {
  final Color color1;
  final Color color2;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? radius;
  final bool isPositioned;

  const Circle({
    required this.color1,
    required this.color2,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.radius,
    this.isPositioned = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget circle = Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [color1, color2],
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
        ),
      ),
    );

    return isPositioned
        ? Positioned(
            bottom: bottom,
            right: right,
            top: top,
            left: left,
            height: radius,
            width: radius,
            child: circle,
          )
        : circle;
  }
}

Center(
  child: Stack(
    children: [
      Circle(
        color1: Color.fromARGB(255, 150, 90, 0),
        color2: Colors.orange,
        radius: 200,
        left: -100,
        bottom: -80,
      ),
      Circle(
        color1: Color.fromARGB(255, 116, 75, 0),
        color2: Colors.orange,
        radius: 150,
        right: -30,
        bottom: 200,
      ),
      BlurSlider(),
    ],
  ),
),

''';

  final codeExplicitAnimations = '''
class Rectangle extends StatelessWidget {
  const Rectangle({
    Key? key,
    this.width = 60,
    this.height = 40,
    required this.color1,
    required this.color2,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color1;
  final Color color2;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 1, color: Colors.black54),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: AlignTransition(
        alignment: _alignAnimation,
        child: RotationTransition(
          turns: _rotationAnimation,
          child: const Rectangle(
            color1: Colors.orangeAccent,
            color2: Colors.deepOrange,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
''';

  final codeAnimatedBuilder = '''
class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.yellowAccent,
                Colors.orange,
                Colors.redAccent
              ],
              stops: [0, _controller.value, 1],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
          ),
        );
      },
    );
  }
}
''';

  /*
  Code Based Animations
  Implicit Animations
  Explicit Animations
  */
  @override
  Widget build(BuildContext context) {
    double listContainerHeight = MediaQuery.of(context).size.height - 400;
    return Scaffold(
      appBar: appBar(context, "Flutter: Animation 2"),
      body: SingleChildScrollView(
          child: ResponsiveGridRow(
        children: [
          cardTitle("Animation 2"),
          cardSubtitle("Implicit Animations - Item Picker"),
          kpadding(),
          ktext(
              "This animation was achieved using only AnimatedContainer, AnimatedPositioned, and AnimatedDefaultTextStyle widgets."),
          kpadding(),
          codeItemGridCol(codeItemPicker),
          kpadding(),
          ResponsiveGridCol(
            child: Center(
              child: SizedBox(
                  width: 400,
                  height: listContainerHeight,
                  child: ItemPicker(containerHeight: listContainerHeight)),
            ),
          ),
          kpadding(),
          cardSubtitle("Implicit Animations - Blur Slider"),
          kpadding(),
          ktext(
              """The TweenAnimationBuilder allows you to implicitly animate any property of any widget using a Tween class. The Tween class takes its name from “Between”. It basically gives you a begin and end values to animate between."""),
          kpadding(),
          codeItemGridCol(codeBlurSlider),
          kpadding(),
          ResponsiveGridCol(
              child: const SizedBox(
            width: 200,
            child: Center(
              child: Stack(
                children: [
                  Circle(
                    color1: Color.fromARGB(255, 150, 90, 0),
                    color2: Colors.orange,
                    radius: 200,
                    left: -100,
                    bottom: -80,
                  ),
                  Circle(
                    color1: Color.fromARGB(255, 116, 75, 0),
                    color2: Colors.orange,
                    radius: 150,
                    right: -30,
                    bottom: 200,
                  ),
                  BlurSlider(),
                ],
              ),
            ),
          )),
          kpadding(),
          cardSubtitle("Explicit Animations - Transition"),
          kpadding(),
          ktext(
              "This was achieved with AlignTransition and RotationTransition"),
          kpadding(),
          codeItemGridCol(codeExplicitAnimations),
          kpadding(),
          ResponsiveGridCol(
              child: const Center(
            child: SizedBox(
              width: 400,
              child: ExplicitAnimations(),
            ),
          )),
          kpadding(),
          cardSubtitle("Explicit Animations - Animated Builder"),
          kpadding(),
          ktext(
              "The AnimatedBuilder “rebuilds” for each changed value of the controller and calls the builder to return the new widget with the updated _controller.value value, causing the gradient to animate."),
          kpadding(),
          codeItemGridCol(codeAnimatedBuilder),
          kpadding(),
          ResponsiveGridCol(
              child: const Center(
            child: SizedBox(
              width: 400,
              child: AnimatedBuilderExample(),
            ),
          )),
          kpadding(),
          kpadding(),
        ],
      )),
    );
  }
}
