import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartExtension extends StatelessWidget {
  static const id = "dart_extension";
  const DartExtension({super.key});

  final code = '''
extension DateFormatting on DateTime {
  String formatBackslash() {
    return '\$day/\$month/\$year';
  }

  String formatHyphen() {
    return '\$day-\$month-\$year';
  }
}

void main() async {
  DateTime now = DateTime.now();
  print(now.formatBackslash());
  print(now.formatHyphen());
}
''';

  final codeResult = '''
\$ dart extension.dart
13/9/2023
13-9-2023
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Extension"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Extension"),
            kpadding(),
            ktext(
                """Extension methods allow you to `extend` any Objects Api."""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
