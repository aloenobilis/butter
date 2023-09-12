import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartAbstract extends StatelessWidget {
  static const id = "dart_abstract";
  const DartAbstract({super.key});

  final code = '''
abstract class Palette {
  String? dark;
  String? normal;
  String? light;

  void log();
}

class Reds implements Palette {
  @override
  String? dark = '#';
  @override
  String? light = '###';
  @override
  String? normal = '#####';

  @override
  void log() {
    print('\$light - \$dark - \$normal');
  }
}

class Oranges implements Palette {
  @override
  String? dark = '*';
  @override
  String? light = '***';
  @override
  String? normal = '*****';

  @override
  void log() {
    print('\$light - \$dark - \$normal');
  }
  
  void logNamed() {
    print('light: \$light - dark: \$dark - normal: \$normal');
  }
}

main() {
  
  Reds reds = Reds();
  reds.log();
  print(reds.light);
  
  Oranges oranges = Oranges();
  oranges.log();
  oranges.logNamed();
}
''';

  final codeResult = '''
\$ dart classes_abstract.dart
### - # - #####
###
*** - * - *****
light: *** - dark: * - normal: *****
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Abstract"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Abstract"),
            kpadding(),
            ktext("""
To define a class that doesn’t require a full, concrete implementation of its entire interface, use the abstract modifier.

Abstract classes cannot be constructed from any library, whether its own or an outside library. Abstract classes often have abstract methods.
"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
