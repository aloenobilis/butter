import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartMap extends StatelessWidget {
  static const id = "dart_map";
  const DartMap({super.key});

  final code = '''
void main() {
  // define a map
  Map<String, dynamic> brands = {
    'shoes': 'Nike',
    'keyboard': 'ZSA',
    'computer': 'Lenovo'
  };
  
  // access value by key
  print(brands['shoes']);
  
  // assign new key value pair
  brands['glasses'] = 'Ray Ban';
  
  // iterate over a map
  brands.forEach((k, v) => print("key: \$k, value: \$v"));
  
  // keys
  print(brands.keys.length);
  
  // values
  print(brands.values.length);
  
  // remove an item by key
  brands.remove('keyboard');
  print(brands.length);
  
}
''';

  final codeResult = '''
\$ dart map.dart
Nike
key: shoes, value: Nike
key: keyboard, value: ZSA
key: computer, value: Lenovo
key: glasses, value: Ray Ban
4
4
3
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Map"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Map"),
            kpadding(),
            ktext(
                "Dart Maps are key value containers, where each key can appear only once, maps are collections that are iterable."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
