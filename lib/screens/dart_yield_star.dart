import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartYieldStar extends StatelessWidget {
  static const id = "dart_yield_star";
  const DartYieldStar({super.key});

  final code = '''
void main() {
  // add collection to Iterable using yield*
  Iterable<int> doubleNumbersTo(int n) sync* {
    int k = 0;
    while (k < n) {
      yield* [k, k];
      k++;
    }
  }

  Iterable numbers = doubleNumbersTo(3);

  for (var item in numbers) {
    print(item);
  }
}

''';

  final codeResult = '''
\$ dart yield_star.dart
0
0
1
1
2
2
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Yield*"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Yield*"),
            kpadding(),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
