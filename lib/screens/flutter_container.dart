import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FlutterContainer extends StatefulWidget {
  static const id = "flutter_container";
  const FlutterContainer({super.key});

  @override
  State<FlutterContainer> createState() => _FlutterContainerState();
}

class _FlutterContainerState extends State<FlutterContainer> {
  bool selected = false;

  final code = '''
Center(
      child: Container(
        transform: Matrix4.rotationZ(0.8),
        decoration: BoxDecoration(
            color: Colors.amber[600],
            border: Border.all(color: Colors.tealAccent, width: 4.0)),
        margin: const EdgeInsets.all(10.0),
        width: 100.0,
        height: 100.0,
        child: const Center(
          child: Text(
            "Container",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    )
''';

  ResponsiveGridCol container() {
    return ResponsiveGridCol(
        child: Center(
      child: Container(
        transform: Matrix4.rotationZ(0.8),
        decoration: BoxDecoration(
            color: Colors.amber[600],
            border: Border.all(color: Colors.tealAccent, width: 4.0)),
        margin: const EdgeInsets.all(10.0),
        width: 100.0,
        height: 100.0,
        child: const Center(
          child: Text(
            "Container",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    ));
  }

  final codeAnimated = '''
bool selected = false;

GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200.0 : 150.0,
            height: selected ? 100.0 : 200.0,
            color: selected ? Colors.red : Colors.blue,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: const Text(
              "Tap Me!",
              style: TextStyle(fontSize: 36),
            ),
          ),
        ),
      ),
''';
  ResponsiveGridCol containerAnimated() {
    return ResponsiveGridCol(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200.0 : 150.0,
            height: selected ? 100.0 : 200.0,
            color: selected ? Colors.red : Colors.blue,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: const Text(
              "Tap Me!",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Flutter: Container"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Container"),
            kpadding(),
            ktext(
                "A convenience widget that combines common painting, positioning, and sizing widgets."),
            kpadding(),
            codeItemGridCol(code),
            container(),
            kpadding(),
            kpadding(),
            kpadding(),
            ktext(
                "Animated version of Container that gradually changes its values over a period of time."),
            kpadding(),
            codeItemGridCol(codeAnimated),
            kpadding(),
            containerAnimated(),
            kpadding(),
            kpadding(),
          ]),
        ));
  }
}
