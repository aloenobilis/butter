import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DartList extends StatelessWidget {
  static const id = "dart_list";
  const DartList({super.key});

  final code = '''
void main() {
  var vehicles = ['Motorbike', 'Truck', 'Helicopter'];
  print(vehicles.length);
  
  // add an item to the list
  vehicles.add('Bicycle');
  
  // add multiple items to the list
  vehicles.addAll(['Train', 'Boat']);
  
  print(vehicles.length);
  
  // remove an item from the list
  vehicles.remove('Motorbike');
  print(vehicles.length);

  // sort the list (alphabetically)
  vehicles.sort();
 
  // list indexes
  for(var i=0;i<vehicles.length;i++) {
    print(vehicles[i]);
  }
  
  // clear the list
  vehicles.clear();
  print(vehicles);
  
}
''';

  final codeResult = '''
\$ dart list.dart
3
6
5
Bicycle
Boat
Helicopter
Train
Truck
[]
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Dart: List"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("List"),
            kpadding(),
            ktext(
                "Dart Lists are ordered groups of objects or `arrays`, the List object is a collection that is iterable."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            codeItemGridCol(codeResult),
          ]),
        ));
  }
}
