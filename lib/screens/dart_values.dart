import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartValues extends StatelessWidget {
  static const id = "dart_values";
  const DartValues({super.key});

  final code = '''
void main() {
  // string concatenation using `+`
  print("smooth" + " as" + " butter");

  // integers
  print("9+1=\${9 + 1}");

  // doubles (float)
  print("7.129/2.1 =\${7.129 / 2.1}");

  // exponents
  print("1.42e5=\${1.42e5}");

  // Booleans
  print(true && false);
  print(false || true);
  print(!true);
}
''';

  final codeResult = '''
\$ dart values.dart
smooth as butter
9+1=10
7.129/2.1 =3.3947619047619044
1.42e5=142000
false
true
false
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Values"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            kpadding(),
            cardTitle("Values"),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            // ktext("Arrow syntax can also be used: "),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
