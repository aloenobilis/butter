import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartIterators extends StatelessWidget {
  static const id = "dart_iterators";
  const DartIterators({super.key});

  final code = '''
void main() {
  // create an Iterable
  Iterable<int> iterable = [1, 2, 3];
  print(iterable.first);
  print(iterable.elementAt(1));
  print(iterable.last);

  // create an Iterator
  Iterator<int> iterator = [4, 5, 6].iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  Iterable<int> generated = Iterable.generate(10);
  // using firstWhere
  int element = generated.firstWhere((element) => element > 6);
  print(element);

  // using where (filtering)
  Iterable elements = generated.where((element) => element % 2 == 0);
  print(elements);

  // using takeWhile (filtering)
  Iterable elements2 = generated.takeWhile((value) => value != 5);
  print(elements2);
}

''';

  final codeResult = '''
\$ dart iterators.dart
1
2
3
4
5
6
7
(0, 2, 4, 6, 8)
(0, 1, 2, 3, 4)
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Iterators"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Iterators"),
            kpadding(),
            ktext(
                """An Iterable is a collection of elements that can be accessed sequentially.
Both List and Set are Iterable, so they have the same methods and properties as the Iterable class.
Iterable, as opposed to List, doesn’t have the [] operator.
"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
