import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartFunctions extends StatelessWidget {
  static const id = "dart_functions";
  const DartFunctions({super.key});

  final code = '''

main() {
  // define a function
  void log(String arg) {
    print(arg);
  }
 
  // call the function
  log('Hello');
  
  // define a function with named paramaters
  void name({required String? first, required String? last}) {
    print("\$first \$last");
  }
  
  // call the function
  name(first: 'John', last: 'Doe'); 
  
  // define a function with optional paramaters
  void time(String hour, {String? minutes}) {
    if(minutes != null) {
      print("\$hour:\$minutes");
    } else {
      print(hour);
    }
  }
  
  // call the function
  time('2', minutes: '30');
}
''';

  final codeResult = '''
\$ dart functions.dart
Hello
John Doe
2:30
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Functions"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Functions"),
            kpadding(),
            ktext(
                "Dart Functions are are objects that have the type `Function`, this means they can be assigned to variables or passed in as arguments to other functions."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
