import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartAsyncStar extends StatelessWidget {
  static const id = "dart_async_star";
  const DartAsyncStar({super.key});

  final code = '''
void main() {
  // To implement an asynchronous generator function, mark the function
  // body as async*, and use yield statements to deliver values:
  Stream<int> evensFromDelayed(int n) async* {
    int k = n;
    while (k >= 0) {
      if (k % 2 == 0) {
        await Future.delayed(const Duration(seconds: 1));
        yield k;
      }
      k--;
    }
  }

  evensFromDelayed(10).forEach(print);
}
''';

  final codeResult = '''
\$ dart async_star.dart
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
        appBar: appBar(context, "Dart: Async*"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Async*"),
            kpadding(),
            ktext(
                """When you need to lazily produce a sequence of values, consider using a generator function as opposed to an eager function. Async generators allows us to await before yielding."""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
