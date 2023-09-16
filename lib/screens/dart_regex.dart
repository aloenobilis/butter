import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartRegex extends StatelessWidget {
  static const id = "dart_regex";
  const DartRegex({super.key});

  final code = '''
void main() async {
  // create a Regex pattern
  RegExp string = RegExp(r'(\\w+)');

  // data
  String data = "Dart is awesome!";

  // first match
  RegExpMatch? match = string.firstMatch(data);
  print(match![0]);

  // all matches
  Iterable<RegExpMatch> matches = string.allMatches(data);
  for (final m in matches) {
    print(m[0]);
  }

  // has match
  print(string.hasMatch(data));
}
''';

  final codeResult = '''
\$ dart regexp.dart
Dart
Dart
is
awesome
true
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Regex"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Regex"),
            kpadding(),
            ktext(
                """Regular expressions consist of a sequence of characters that specify a match-checking algorithm for text inputs."""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
