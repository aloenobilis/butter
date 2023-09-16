import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartWhile extends StatelessWidget {
  static const id = "dart_while";
  const DartWhile({super.key});

  final code = '''
void main() {

  // while loop - evaluates the condition before the loop
  // first condition then execution
  var i = 0;
  while(i < 5) {
    // do block
    print(i);
    i++;
  }

  // do-while - evalutes the condition after the loop
  // first execution then condition
  var j = 0;
  do {
    print(j);
    j++;
  } while (j < 5);
}
''';

  final codeResult = '''
\$ dart while.dart
0
1
2
3
4
0
1
2
3
4
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: While"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("While"),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
