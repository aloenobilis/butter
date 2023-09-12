import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartRecord extends StatelessWidget {
  static const id = "dart_record";
  const DartRecord({super.key});

  final code = '''
void main() {
  
  // define a record with type annotation
  ({int a, bool b}) record;
  
  // initialize the record
  record = (a: 123, b: true);
  
  // access record fields using built-in getters
  print(record.a);
  print(record.b);
    
  // define a record with positional (\$<position>) and named fields
  var record2 = ('first', a: 2, b: true, 'last');
  print(record2.\$1);
  print(record2.a);
  
  // Record type annotations are comma-delimited lists of types enclosed in parentheses
  (int, int) swap((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }
  
  var record3 = (1,2);
  print(swap(record3));
  
  // a list of records
  List records = [(a: 1, b: 2), (c: 3, d: 4)];
  print(records);
 }
''';

  final codeResult = '''
\$ dart record.dart
123
true
first
2
(2, 1)
[(a: 1, b: 2), (c: 3, d: 4)]
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: Record"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Record"),
            kpadding(),
            ktext("""
Records are an anonymous, immutable, aggregate type. Like other collection types, they let you bundle multiple objects into a single object. Unlike other collection types, records are fixed-sized, heterogeneous, and typed.

Records are real values; you can store them in variables, nest them, pass them to and from functions, and store them in data structures such as lists, maps, and sets.
"""),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
