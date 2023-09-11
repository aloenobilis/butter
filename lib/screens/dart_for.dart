import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartFor extends StatelessWidget {
  static const id = "dart_for";
  const DartFor({super.key});

  final code = '''
void main() {
  // for loop
  for (var i=0; i<3; i++) {
    print(i);
  }


  // for-in can be used on any iterable
  var collection = [3, 4, 5];
  for (var x in collection) {
    print(x);
  }

  // for-each
  final numbers = <int>[1,2,6,7];
  numbers.forEach(print);
}
''';

  final codeResult = '''
\$ dart for.dart
0
1
2
3
4
5
1
2
6
7

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: For"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            kpadding(),
            cardTitle("For"),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
