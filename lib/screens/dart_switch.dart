import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartSwitch extends StatelessWidget {
  static const id = "dart_switch";
  const DartSwitch({super.key});

  final code = '''
void main() {
    var status_code = 200;
    switch (status_code) {
      case 404:
        print('Not Found');
      case 200:
      case 201:
        print('Success');
      default:
        print('Unknown');
    }
}
''';

  final codeExpressions = '''
void main() {
    // switch-expression using logical or
    var fruit = 'lettuce';
    var isFruit = switch(fruit) {
        'apple' || 'banana' || 'mango' => true,
        _ => false
    };
  
    print(isFruit);

}
''';

  final codeNextCase = '''
void main() {
    var drink = 'coffee';
        
    switch (drink) {
      case 'coffee':
        print('1 X coffee');
        continue milk;
   
      milk:
      case 'hot chocolate':
        print('1 X milk');
        continue sugar;
      
      sugar:
      case 'tea':
        print('1 X sugar'); 
    }
}
''';

  final codeResult = '''
\$ dart switch.dart
Success
false
1 X coffee
1 X milk
1 X sugar
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Switch"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Switch"),
            kpadding(),
            ktext(
                "A switch statement evaluates a value expression against a series of cases, when the value matches a case's pattern the case body executes."),
            ktext(
                "In Dart the break statement is just syntactic sugar and can be omitted."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            ktext("Switch statement expression: "),
            kpadding(),
            codeItemGridCol(codeExpressions),
            kpadding(),
            ktext(
                "Switch using labels and continue. Diverting execution to a label using continue:label_name will execute the case block. A label must shadow an existing case in order to label the case block."),
            kpadding(),
            codeItemGridCol(codeNextCase),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
