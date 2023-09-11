import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:selectable_code_view/selectable_code_view.dart';

ResponsiveGridCol codeItemGridCol(String code) {
  return ResponsiveGridCol(
    child: Center(
      child: SizedBox(
        width: 500,
        height: code.split('\n').length * 20,
        child: SelectableCodeView(
          code: code,
          language: Language.DART,
          languageTheme: LanguageTheme.ayuDark(),
          fontSize: 14.0,
          withZoom: false,
          withLinesCount: false,
          expanded: true,
        ),
      ),
    ),
  );
}
