import 'package:butter/screens/dart_abstract.dart';
import 'package:butter/screens/dart_classes.dart';
import 'package:butter/screens/dart_error_handling.dart';
import 'package:butter/screens/dart_for.dart';
import 'package:butter/screens/dart_functions.dart';
import 'package:butter/screens/dart_hello_world.dart';
import 'package:butter/screens/dart_if_else.dart';
import 'package:butter/screens/dart_list.dart';
import 'package:butter/screens/dart_map.dart';
import 'package:butter/screens/dart_mixin.dart';
import 'package:butter/screens/dart_null_aware.dart';
import 'package:butter/screens/dart_record.dart';
import 'package:butter/screens/dart_set.dart';
import 'package:butter/screens/dart_switch.dart';
import 'package:butter/screens/dart_values.dart';
import 'package:butter/screens/dart_variables.dart';
import 'package:butter/screens/dart_while.dart';
import 'package:butter/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Butter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        DartHelloWorld.id: (context) => const DartHelloWorld(),
        DartValues.id: (context) => const DartValues(),
        DartVariables.id: (context) => const DartVariables(),
        DartFor.id: (context) => const DartFor(),
        DartIfElse.id: (context) => const DartIfElse(),
        DartNullAware.id: (context) => const DartNullAware(),
        DartWhile.id: (context) => const DartWhile(),
        DartSwitch.id: (context) => const DartSwitch(),
        DartExceptions.id: (context) => const DartExceptions(),
        DartList.id: (context) => const DartList(),
        DartMap.id: (context) => const DartMap(),
        DartSet.id: (context) => const DartSet(),
        DartRecord.id: (context) => const DartRecord(),
        DartFunctions.id: (context) => const DartFunctions(),
        DartClasses.id: (context) => const DartClasses(),
        DartAbstract.id: (context) => const DartAbstract(),
        DartMixin.id: (context) => const DartMixin(),
      },
    );
  }
}
