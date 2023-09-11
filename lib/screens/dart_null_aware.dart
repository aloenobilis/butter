import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartNullAware extends StatelessWidget {
  static const id = "dart_null_aware";
  const DartNullAware({super.key});

  final code = '''
void main() {
  // `??=` will assign a value to a variable only if that variable is null
  int? a;
  a ??= 3;
  print(a);

  // `??` will return the expression to the left if its value is not null
  // otherwise the right expression will be returned
  print(1 ?? 3);
  print(null ?? 12);
  print(null ?? null);
}
''';

  final codeResult = '''
\$ dart nullaware.dart
3
1
12
null
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Null-aware"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            kpadding(),
            cardTitle("Null-aware operators"),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
