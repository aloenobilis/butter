import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartStreams extends StatelessWidget {
  static const id = "dart_streams";
  const DartStreams({super.key});

  final code = '''
import 'dart:async';

void main() {
  // single subscription stream
  final data = [1, 2, 3];
  final stream = Stream.fromIterable(data);
  stream.listen((event) => print("stream: \$event"));

  // broadcast stream (mulitple listeners)
  final controller = StreamController.broadcast();
  final bstream = controller.stream;
  bstream.listen((event) => print("broadcast 1: \$event"));
  bstream.listen((event) => print("broadcast 2: \$event"));

  controller.add('hello');
  controller.add('world');
}
''';

  final codeResult = '''
\$ dart streams.dart
stream: 1
broadcast 1: hello
broadcast 2: hello
stream: 2
broadcast 1: world
broadcast 2: world
stream: 3

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Streams"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Streams"),
            kpadding(),
            ktext(
                "A Stream provides a way to receive a sequence of asynchronous data events."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
