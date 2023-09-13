import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartFutures extends StatelessWidget {
  static const id = "dart_futures";
  const DartFutures({super.key});

  final code = '''
main() async {
  Future delayed(int second) {
    return Future.delayed(const Duration(seconds: 1)).then((_) {
      return '\$second'
    });
  }
    
  for(var i=1; i<11; i++) {
    await delayed(i).then((String val) => print(val));
  }
  
 }
''';

  final codeResult = '''
\$ dart futures.dart
1
2
3
4
5
6
7
8
9
10
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Futures"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Futures"),
            kpadding(),
            ktext("""
Dart libraries are full of functions that return Future or Stream objects. These functions are asynchronous: they return after setting up a possibly time-consuming operation (such as I/O), without waiting for that operation to complete.

The async and await keywords support asynchronous programming, letting you write asynchronous code that looks similar to synchronous code.
"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
