import 'dart:async';

import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FlutterColor extends StatelessWidget {
  static const id = "flutter_color";
  const FlutterColor({super.key});

  final code = '''
Color c1 = const Color(0xFF42A5F5);
Color c2 = const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5);
Color c3 = const Color.fromARGB(255, 66, 165, 245);
Color c4 = const Color.fromRGBO(66, 165, 245, 1.0);
''';

  final codeColors = '''
Color c1 = Colors.blue;
Color c2 = Colors.blue[200];
Color c3 = Colors.blue[200]!.withOpacity(0.2);
Color c4 = Colors.blue.shade200;

''';

  final codeMaterial = '''
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

Container(
  width: 75,
  height: 75,
  color: createMaterialColor(const Color(0xFF174378)),
  child: const Text('Custom'),
),
''';
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  ResponsiveGridCol colors() {
    return ResponsiveGridCol(
        child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 75,
            height: 75,
            color: createMaterialColor(const Color(0xFF174378)),
            child: const Text('Custom'),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Flutter: Color"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Color"),
            kpadding(),
            ktext("Color: An immutable 32 bit color value in ARGB format."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            ktext(
                "Colors: constants which represent Material design's color palette."),
            kpadding(),
            codeItemGridCol(codeColors),
            kpadding(),
            ktext(
                "MaterialColor: Defines a single color as well a color swatch with ten shades of the color."),
            kpadding(),
            codeItemGridCol(codeMaterial),
            colors(),
            kpadding(),
            kpadding(),
          ]),
        ));
  }
}
