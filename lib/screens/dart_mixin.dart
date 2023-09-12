import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartMixin extends StatelessWidget {
  static const id = "dart_mixin";
  const DartMixin({super.key});

  final code = '''
mixin Controlls {
  void moveForward();
  void moveBackward();
}

class Robot with Controlls {
  @override
  void moveForward() {
    print("Robot Forwards");
  }
  
  @override
  void moveBackward() {
    print("Robot Backwards");
  }
}

class Remote with Controlls {
  @override
  void moveForward() {
    print("Remote Forwards");
  }
  
  @override
  void moveBackward() {
    print("Remote Backwards");
  }
}


main() {
 
  Robot robot = Robot();
  Remote remote = Remote();
  
  remote.moveForward();
  robot.moveForward();
  remote.moveBackward();
  robot.moveBackward(); 
}
''';

  final codeResult = '''
\$ dart classes_mixin.dart
Remote Forwards
Robot Forwards
Remote Backwards
Robot Backwards
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Mixin"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Mixin"),
            kpadding(),
            ktext("""
Mixins are a way of defining code that can be reused in multiple class hierarchies. They are intended to provide member implementations en masse.

To use a mixin, use the with keyword followed by one or more mixin names.
"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
