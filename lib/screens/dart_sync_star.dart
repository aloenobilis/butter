import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartSyncStar extends StatelessWidget {
  static const id = "dart_sync_star";
  const DartSyncStar({super.key});

  final code = '''
void main() {
  // To implement a synchronous generator function, mark the function
  // body as sync*, and use yield statements to deliver values:
  Iterable<int> evensFrom(int n) sync* {
    int k = n;
    while (k >= 0) {
      if (k % 2 == 0) {
        yield k;
      }
      k--;
    }
  }

  evensFrom(10).forEach(print);
}
''';

  final codeResult = '''
\$ dart sync_star.dart
10
8
6
4
2
0

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Sync*"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Sync*"),
            kpadding(),
            ktext(
                """When you need to lazily produce a sequence of values, consider using a generator function, as opposed to an eager function."""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
