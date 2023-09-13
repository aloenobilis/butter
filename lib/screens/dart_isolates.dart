import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartIsolates extends StatelessWidget {
  static const id = "dart_isolates";
  const DartIsolates({super.key});

  final code = '''
import 'dart:isolate';

void main() async {
  // set up some resource intensive function
  Future<String> task() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'done';
  }

  // Read some data.
  final data = await Isolate.run(task);

  // Use that data.
  print('Task is: \$data');
}

''';

  final codeResult = '''
\$ dart isolates.dart
Task is: done
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Isolates"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Isolates"),
            kpadding(),
            ktext(
                """Instead of threads, all Dart code runs inside of isolates. Each isolate has its own memory heap, ensuring that none of the state in an isolate is accessible from any other isolate.
Using isolates, your Dart code can perform multiple independent tasks at once, i.e running in parallel.
"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
