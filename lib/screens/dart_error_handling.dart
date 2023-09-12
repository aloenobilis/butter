import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartExceptions extends StatelessWidget {
  static const id = "dart_exceptions";
  const DartExceptions({super.key});

  final code = '''
// custom exception
class ChairException implements Exception {
  String msg;
  ChairException(this.msg);
  
  @override
  toString() {
    return msg;
  }
}

void main() {
  int numChairs = 7;
  try {
    if(numChairs % 2 != 0) {
      throw ChairException('Not even amount of chairs for the table');
    } else if(numChairs == 11) {
      throw 'Too Many Chairs';        // <-- throw arbritrary object
    }
  } on ChairException catch(e) {
    print(e);
  } catch(e) {                        // <-- catch all
    print(e);
  } finally {                         // <-- run even if exception is thrown
    print('Clean the table');
  }
}
''';

  final codeResult = '''
\$ dart exceptions.dart
Not even amount of chairs for the table
Clean the table
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Exceptions"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Exceptions"),
            kpadding(),
            ktext(
                "Dart provides Exception and Error types, as well as numerous predefined subtypes. You can, of course, define your own exceptions. However, Dart programs can throw any non-null object—not just Exception and Error objects—as an exception."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
