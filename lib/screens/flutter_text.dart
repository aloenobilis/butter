import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FlutterText extends StatelessWidget {
  static const id = "flutter_text";
  const FlutterText({super.key});

  final code = '''
const Text(
      'Hello Flutter!',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 42, 
          color: Colors.tealAccent),
    )
''';

  ResponsiveGridCol text() {
    return ResponsiveGridCol(
        child: const Center(
      child: Text(
        'Hello Flutter!',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 42,
            color: Colors.tealAccent),
      ),
    ));
  }

  final codeRich = '''
RichText(
        text: const TextSpan(
          text: 'Hello ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              color: Colors.tealAccent),
          children: <TextSpan>[
            TextSpan(
                text: 'Flutter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.blueAccent)),
            TextSpan(
                text: '!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.orangeAccent)),
          ],
        ),
      ),
''';

  ResponsiveGridCol richText() {
    return ResponsiveGridCol(
        child: Center(
      child: RichText(
        text: const TextSpan(
          text: 'Hello ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              color: Colors.tealAccent),
          children: <TextSpan>[
            TextSpan(
                text: 'Flutter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.blueAccent)),
            TextSpan(
                text: '!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.orangeAccent)),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Flutter: Text"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Text"),
            kpadding(),
            ktext(
                "The Text widget displays a string of text with single style."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            text(),
            kpadding(),
            ktext(
                "The RichText widget displays text that uses multiple different styles."),
            kpadding(),
            codeItemGridCol(codeRich),
            richText(),
          ]),
        ));
  }
}
