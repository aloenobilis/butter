import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartVariables extends StatelessWidget {
  static const id = "dart_variables";
  const DartVariables({super.key});

  final code = '''
void main() {
  // 'var' declares a variable.  dartanalyzer infers the type.
  var a = "initial";
  print(a);

  // The type can also be declared:
  num b = 42;
  print(b);

  // final variables cannot be changed once declared
  final num c = 99;
  print(c);

  // const variables are compile-time constants
  const double d = 44.00;
  print(d);
}
''';

  final codeResult = '''
\$ dart variables.dart
initial
42
99
44.0
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Variables"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            kpadding(),
            cardTitle("Variables"),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
