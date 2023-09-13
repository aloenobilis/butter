import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartHttp extends StatelessWidget {
  static const id = "dart_http";
  const DartHttp({super.key});

  final code = '''
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Uri: authority:path:paramaters
  var url = Uri.http('hn.algolia.com', 'api/v1/search', {'query': 'dart'});

  var response = await http.get(url);

  // decode response
  var parsedJson = json.decode(response.body);

  var result = parsedJson['hits'][0];
  var title = result['title'];
  var link = result['url'];
  print('\$title : \$link');
}
''';

  final codeResult = '''
\$ dart http.dart
Dart language : http://www.dartlang.org/
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Http"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Http"),
            kpadding(),
            ktext(
                """A composable, Future-based library for making HTTP requests. See https://pub.dev/packages/http"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
