import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartClasses extends StatelessWidget {
  static const id = "dart_classes";
  const DartClasses({super.key});

  final code = '''
class Book {
  
  // instance variables 
  final String? author;
  final String? title;
  
  // constructor
  const Book(this.author, this.title);
}

main() {
 
  Book book = const Book('Josh Kaufmann', 'The Personal MBA');
  print("\${book.title} by \${book.author}");
  
  List<Book> books = [book];
  print(books);
}
''';

  final codeResult = '''
\$ dart classes_core.dart
The Personal MBA by Josh Kaufmann
[Instance of 'Book']
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Classes"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Classes"),
            kpadding(),
            ktext(
                "Dart is an object-oriented language with classes and mixin-based inheritance. Every object is an instance of a class, and all classes except Null descend from Object. Mixin-based inheritance means that although every class (except for the top class, Object?) has exactly one superclass, a class body can be reused in multiple class hierarchies."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
