import 'dart:async';

import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FlutterStreamBuilder extends StatefulWidget {
  static const id = "flutter_stream_builder";
  const FlutterStreamBuilder({super.key});

  @override
  State<FlutterStreamBuilder> createState() => _FlutterStreamBuilderState();
}

class _FlutterStreamBuilderState extends State<FlutterStreamBuilder> {
  final controller = StreamController.broadcast();

  final code = '''
final controller = StreamController.broadcast();

StreamBuilder(
  stream: controller.stream,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text((snapshot.data).toString());
    }
    return const Text('waiting...');
  },
),

StreamBuilder(
  stream: controller.stream,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text((snapshot.data * 2).toString());
    }
    return const Text('waiting...');
  },
),

ElevatedButton(
  child: const Text('Add data to stream'),
  onPressed: () async {
    for (var i = 0; i < 60; i++) {
      controller.add(i);
      await Future.delayed(const Duration(seconds: 1));
    }
  },
),
''';

  ResponsiveGridCol streamBuilder() {
    return ResponsiveGridCol(
        child: Center(
      child: StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text((snapshot.data).toString());
          }
          return const Text('waiting...');
        },
      ),
    ));
  }

  ResponsiveGridCol streamBuilder2() {
    return ResponsiveGridCol(
        child: Center(
      child: StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text((snapshot.data * 2).toString());
          }
          return const Text('waiting...');
        },
      ),
    ));
  }

  ResponsiveGridCol button() {
    return ResponsiveGridCol(
        child: Center(
      child: ElevatedButton(
        child: const Text('Add data to stream'),
        onPressed: () async {
          for (var i = 0; i < 60; i++) {
            controller.add(i);
            await Future.delayed(const Duration(seconds: 1));
          }
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Flutter: Stream Builder"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Stream Builder"),
            kpadding(),
            ktext(
                "Widget that builds itself based on the latest snapshot of interaction with a Stream."),
            kpadding(),
            codeItemGridCol(code),
            streamBuilder(),
            streamBuilder2(),
            button(),
          ]),
        ));
  }
}
