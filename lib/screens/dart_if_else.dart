import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartIfElse extends StatelessWidget {
  static const id = "dart_if_else";
  const DartIfElse({super.key});

  final code = '''
void main() {

  // if-else-if-else statement 
  int tempreture = 30;
  if(tempreture >= 50) {
    print("hot");
  } else if(tempreture >= 20) {
    print("mild");
  } else {
    print("cold");
  }


  // ternary operators
  10 % 2 == 0 
    ? print("even")
    : print("odd");
}
''';

  final codeResult = '''
\$ dart ifelse.dart
mild
even
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: If/Else"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("If/Else"),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
