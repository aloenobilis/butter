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
  // type:variable - declare a typed variable
  int hearts = 5;
  print(hearts);

  // var:variable - declare a variable, inferred type
  var plants = ['Hibiscus', 'Aloe']
  print(plants);

  // final:type:variable - declare a variable that cannot be changed
  final day = DateTime.now().day;
  print(day);

  // const:type:variable - declare a compile time constant
  const double pi = 3.14159;
  print(pi);

}
''';

  final codeResult = '''
\$ dart variables.dart
5
[Hibiscus, Aloe]
12                 # could be different
3.14159
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Variables"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
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
