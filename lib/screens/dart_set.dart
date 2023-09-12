import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartSet extends StatelessWidget {
  static const id = "dart_set";
  const DartSet({super.key});

  final code = '''
void main() {
  // define a set
  Set cities = <String>{'New York', 'Tokyo', 'Paris'};
  
  // add an item to the set
  cities.add('Copenhagen');
 
  // iterate over the set
  cities.forEach((v) => print(v));
  
  // convert a list to a set
  List<int> numbers = [1,1,2,2,3,3,4,4,5,5];
  Set uniqueNumbers = numbers.toSet();
  print(uniqueNumbers);
}
''';

  final codeResult = '''
\$ dart set.dart
New York
Tokyo
Paris
Copenhagen
{1, 2, 3, 4, 5}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Set"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Set"),
            kpadding(),
            ktext(
                "Dart Sets are unordered collections where each value must be unique, sets are iterable."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
