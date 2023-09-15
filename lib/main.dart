import 'package:butter/screens/dart_abstract.dart';
import 'package:butter/screens/dart_async_star.dart';
import 'package:butter/screens/dart_await_for.dart';
import 'package:butter/screens/dart_classes.dart';
import 'package:butter/screens/dart_error_handling.dart';
import 'package:butter/screens/dart_extension.dart';
import 'package:butter/screens/dart_for.dart';
import 'package:butter/screens/dart_functions.dart';
import 'package:butter/screens/dart_futures.dart';
import 'package:butter/screens/dart_hello_world.dart';
import 'package:butter/screens/dart_http.dart';
import 'package:butter/screens/dart_if_else.dart';
import 'package:butter/screens/dart_isolates.dart';
import 'package:butter/screens/dart_iterators.dart';
import 'package:butter/screens/dart_list.dart';
import 'package:butter/screens/dart_map.dart';
import 'package:butter/screens/dart_mixin.dart';
import 'package:butter/screens/dart_null_aware.dart';
import 'package:butter/screens/dart_record.dart';
import 'package:butter/screens/dart_regex.dart';
import 'package:butter/screens/dart_set.dart';
import 'package:butter/screens/dart_streams.dart';
import 'package:butter/screens/dart_switch.dart';
import 'package:butter/screens/dart_sync_star.dart';
import 'package:butter/screens/dart_values.dart';
import 'package:butter/screens/dart_variables.dart';
import 'package:butter/screens/dart_while.dart';
import 'package:butter/screens/dart_yield_star.dart';
import 'package:butter/screens/flutter_color.dart';
import 'package:butter/screens/flutter_container.dart';
import 'package:butter/screens/flutter_animation.dart';
import 'package:butter/screens/flutter_stream_builder.dart';
import 'package:butter/screens/flutter_text.dart';
import 'package:butter/screens/flutter_text_field.dart';
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
        DartFutures.id: (context) => const DartFutures(),
        DartStreams.id: (context) => const DartStreams(),
        DartIterators.id: (context) => const DartIterators(),
        DartSyncStar.id: (context) => const DartSyncStar(),
        DartAsyncStar.id: (context) => const DartAsyncStar(),
        DartAwaitFor.id: (context) => const DartAwaitFor(),
        DartYieldStar.id: (context) => const DartYieldStar(),
        DartIsolates.id: (context) => const DartIsolates(),
        DartExtension.id: (context) => const DartExtension(),
        DartHttp.id: (context) => const DartHttp(),
        DartRegex.id: (context) => const DartRegex(),
        FlutterText.id: (context) => const FlutterText(),
        FlutterColor.id: (context) => const FlutterColor(),
        FlutterContainer.id: (context) => const FlutterContainer(),
        FlutterTextField.id: (context) => const FlutterTextField(),
        FlutterStreamBuilder.id: (context) => const FlutterStreamBuilder(),
        FlutterAnimation.id: (context) => FlutterAnimation(),
      },
    );
  }
}
