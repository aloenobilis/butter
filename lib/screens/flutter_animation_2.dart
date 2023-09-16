import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_subtitle.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
      duration: const Duration(seconds: 10),
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
          child: Container(
            color: Colors.orangeAccent,
            width: 50,
            height: 50,
          ),
        ),
      ),
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

  /*
  Code Based Animations
  Implicit Animations
  Explicit Animations
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Flutter: Animation 2"),
      body: SingleChildScrollView(
          child: ResponsiveGridRow(
        children: [
          cardTitle("Animation 2"),
          cardSubtitle("Animated Container"),
          kpadding(),
          ktext(
              "Animated version of Container that gradually changes its values over a period of time."),
          kpadding(),
          codeItemGridCol(codeContainer),
          animatedContainer(),
          kpadding(),
          kpadding(),
          ResponsiveGridCol(
            child: const ExplicitAnimations(),
          ),
          kpadding(),
          kpadding(),
          kpadding(),
        ],
      )),
    );
  }
}
