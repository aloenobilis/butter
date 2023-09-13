import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartAwaitFor extends StatelessWidget {
  static const id = "dart_await_for";
  const DartAwaitFor({super.key});

  final code = '''
void main() async {
  // await for
  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (final value in stream) {
      sum += value;
    }
    return sum;
  }

  // generated stream using async* and yield
  Stream<int> countStream(int to) async* {
    for (int i = 1; i <= to; i++) {
      yield i;
    }
  }

  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}
''';

  final codeResult = '''
\$ dart await_for.dart
55
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Await For"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Await For"),
            kpadding(),
            ktext(
                """The asynchronous for loop (commonly just called await for) iterates over the events of a stream like the for loop iterates over an Iterable.
"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
