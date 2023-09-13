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
import 'package:butter/screens/dart_set.dart';
import 'package:butter/screens/dart_streams.dart';
import 'package:butter/screens/dart_switch.dart';
import 'package:butter/screens/dart_sync_star.dart';
import 'package:butter/screens/dart_values.dart';
import 'package:butter/screens/dart_variables.dart';
import 'package:butter/screens/dart_while.dart';
import 'package:butter/screens/dart_yield_star.dart';
import 'package:butter/widgets/card_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/page_title.dart';
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
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            // TODO pass down the route id for navigation not the entire screen!
            cardTitle("Dart"),
            kpadding(),
            cardItem("Hello World", context, const DartHelloWorld()),
            cardItem("Values", context, const DartValues()),
            cardItem("Variables", context, const DartVariables()),
            cardItem("For", context, const DartFor()),
            cardItem("If/Else", context, const DartIfElse()),
            cardItem("Null-aware", context, const DartNullAware()),
            cardItem("While", context, const DartWhile()),
            cardItem("Switch", context, const DartSwitch()),
            cardItem("Exceptions", context, const DartExceptions()),
            cardItem("List", context, const DartList()),
            cardItem("Map", context, const DartMap()),
            cardItem("Set", context, const DartSet()),
            cardItem("Record", context, const DartRecord()),
            cardItem("Functions", context, const DartFunctions()),
            cardItem("Classes", context, const DartClasses()),
            cardItem("Abstract", context, const DartAbstract()),
            cardItem("Mixin", context, const DartMixin()),
            cardItem("Futures", context, const DartFutures()),
            cardItem("Streams", context, const DartStreams()),
            cardItem("Iterators", context, const DartIterators()),
            cardItem("Sync*", context, const DartSyncStar()),
            cardItem("Async*", context, const DartAsyncStar()),
            cardItem("Await For", context, const DartAwaitFor()),
            cardItem("Yield*", context, const DartYieldStar()),
            cardItem("Isolates", context, const DartIsolates()),
            cardItem("Extension", context, const DartExtension()),
            cardItem("Http", context, const DartHttp()),
            //
            // kpadding(),
            // cardTitle("Flutter"),
            // kpadding(),
            // cardItem("Container*", context, const DartHelloWorld()),
          ]),
        ));
  }
}
