import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartHelloWorld extends StatelessWidget {
  static const id = "dart_hello_world";
  const DartHelloWorld({super.key});

  final code = '''
void main() {
  print('Hello World!');
}
''';

  final codeArrow = '''
void main() => print('Hello World!');
''';

  final codeResult = '''
\$ dart hello_world.dart
Hello World!
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dart: Hello World"),
        ),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            kpadding(),
            ktext(
                "The main() function is the programs entry point, it can only be used once."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            ktext("Arrow syntax can also be used: "),
            kpadding(),
            codeItemGridCol(codeArrow),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
