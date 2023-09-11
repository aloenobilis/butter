import 'package:butter/screens/dart_hello_world.dart';
import 'package:butter/widgets/card_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white54,
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Butter",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            kpadding(),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Hello World", context, const DartHelloWorld()),
          ]),
        ));
  }
}
