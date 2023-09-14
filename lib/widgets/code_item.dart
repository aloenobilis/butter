import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme.dart';
import 'package:any_syntax_highlighter/any_syntax_highlighter.dart';

AnySyntaxHighlighterTheme butter = const AnySyntaxHighlighterTheme(
    classStyle: TextStyle(color: Colors.orangeAccent),
    staticStyle: TextStyle(
      color: Color.fromRGBO(255, 153, 0, 1),
    ),
    constructor: TextStyle(
      color: Colors.orange,
    ),
    multilineComment: TextStyle(
      color: Color.fromRGBO(187, 174, 170, 1),
    ),
    comment: TextStyle(
      color: Color.fromRGBO(187, 174, 170, 1),
    ),
    keyword: TextStyle(
      color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
      fontWeight: FontWeight.bold,
    ),
    identifier: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    function: TextStyle(
      color: Color.fromARGB(255, 64, 185, 255),
    ),
    number: TextStyle(
      color: Color.fromRGBO(113, 176, 251, 1),
    ),
    string: TextStyle(
      color: Color.fromRGBO(113, 176, 251, 1),
    ),
    operator: TextStyle(
      color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
      fontWeight: FontWeight.bold,
    ),
    separator: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    method: TextStyle(
      color: Color.fromRGBO(200, 132, 251, 1),
    ),
    private: TextStyle(
      color: Color.fromRGBO(255, 152, 16, 1),
    ),
    decoration: BoxDecoration(color: Colors.black12),
    fontFeatures: [FontFeature.slashedZero()]);

ResponsiveGridCol codeItemGridCol(String code) {
  return ResponsiveGridCol(
    child: Center(
      child: SizedBox(
          width: 750,
          height: code.split('\n').length * 20,
          child: AnySyntaxHighlighter(
            code,
            fontSize: 15,
            lineNumbers: false,
            theme: butter,
            isSelectableText: true,
            useGoogleFont: 'Fira Code',
            copyIcon:
                const Icon(Icons.copy_rounded, color: Colors.orangeAccent),
            hasCopyButton: true,
            maxLines: code.split('\n').length * 2,
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToLastDescent: false),
          )),
    ),
  );
}
