import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FlutterTextField extends StatefulWidget {
  static const id = "flutter_text_field";
  const FlutterTextField({super.key});

  @override
  State<FlutterTextField> createState() => _FlutterTextFieldState();
}

class _FlutterTextFieldState extends State<FlutterTextField> {
  String input = 'my text';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = input;
  }

  ResponsiveGridCol textField() {
    return ResponsiveGridCol(
      child: Center(
        child: Container(
          width: 750,
          child: TextField(
            controller: controller,
            onChanged: (String? value) {
              setState(() => input = value!);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[600]),
              hintText: 'Hint Text',
              labelText: 'Input text here...',
              prefixIcon: const Icon(Icons.text_fields_rounded),
              errorText: input.length > 10 ? 'Max 10 Characters' : null,
            ),
          ),
        ),
      ),
    );
  }

  ResponsiveGridCol text() {
    return ResponsiveGridCol(
        child: Center(
      child: Text(
        input,
        style: const TextStyle(fontSize: 24, color: Colors.pink),
      ),
    ));
  }

  final code = '''
String input = 'my text';
TextEditingController controller = TextEditingController();

@override
void initState() {
  super.initState();
  controller.text = input;
}

TextField(
  controller: controller,
  onChanged: (String? value) {
    setState(() => input = value!);
  },
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    border: const OutlineInputBorder(),
    hintStyle: TextStyle(color: Colors.grey[600]),
    hintText: 'Hint Text',
    labelText: 'Input text here...',
    prefixIcon: const Icon(Icons.text_fields_rounded),
    errorText: input.length > 10 ? 'Max 10 Characters' : null,
  ),
  ),
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Flutter: Text Field"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("Text Field"),
            kpadding(),
            ktext(
                "Text fields allow users to type text into an app. They are used to build forms, send messages, create search experiences, and more."),
            kpadding(),
            codeItemGridCol(code),
            kpadding(),
            textField(),
            kpadding(),
            text(),
          ]),
        ));
  }
}
