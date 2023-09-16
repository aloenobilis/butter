import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FlutterNavigator extends StatelessWidget {
  static const id = "flutter_navigator";
  const FlutterNavigator({super.key});

  final code = '''
Navigator.pop(context);
''';

  final codePushNamed = '''
void main() {
  runApp(MaterialApp(
    home: const MyAppHome(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => const MyPage(title: Text('page A')),
      '/b': (BuildContext context) => const MyPage(title: Text('page B')),
      '/c': (BuildContext context) => const MyPage(title: Text('page C')),
    },
  ));
}

Navigator.pushNamed(context, '/b');
''';

  final codePush = '''
Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => const MyScreen()));
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Flutter: Navigator"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Navigator"),
            kpadding(),
            ktext("The navigator manages a stack of Route objects."),
            kpadding(),
            ktext(
                "Navigator.pop: Pop the top-most route off the navigator that most tightly encloses the given context."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            ktext(
                "Navigator.pushNamed: Push a named route onto the navigator that most tightly encloses the given context."),
            kpadding(),
            codeItemGridCol(codePushNamed),
            kpadding(),
            ktext(
                "Navigator.push: Push the given route onto the navigator that most tightly encloses the given context."),
            kpadding(),
            codeItemGridCol(codePush),
          ]),
        ));
  }
}
