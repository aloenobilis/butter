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
import 'package:butter/screens/flutter_container.dart';
import 'package:butter/screens/flutter_text.dart';
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
            cardTitle("Dart"),
            kpadding(),
            cardItem("Hello World", context, DartHelloWorld.id),
            cardItem("Values", context, DartValues.id),
            cardItem("Variables", context, DartVariables.id),
            cardItem("For", context, DartFor.id),
            cardItem("If/Else", context, DartIfElse.id),
            cardItem("Null-aware", context, DartNullAware.id),
            cardItem("While", context, DartWhile.id),
            cardItem("Switch", context, DartSwitch.id),
            cardItem("Exceptions", context, DartExceptions.id),
            cardItem("List", context, DartList.id),
            cardItem("Map", context, DartMap.id),
            cardItem("Set", context, DartSet.id),
            cardItem("Record", context, DartRecord.id),
            cardItem("Functions", context, DartFunctions.id),
            cardItem("Classes", context, DartClasses.id),
            cardItem("Abstract", context, DartAbstract.id),
            cardItem("Mixin", context, DartMixin.id),
            cardItem("Futures", context, DartFutures.id),
            cardItem("Streams", context, DartStreams.id),
            cardItem("Iterators", context, DartIterators.id),
            cardItem("Sync*", context, DartSyncStar.id),
            cardItem("Async*", context, DartAsyncStar.id),
            cardItem("Await For", context, DartAwaitFor.id),
            cardItem("Yield*", context, DartYieldStar.id),
            cardItem("Isolates", context, DartIsolates.id),
            cardItem("Extension", context, DartExtension.id),
            cardItem("Http", context, DartHttp.id),
            kpadding(),
            cardTitle("Flutter"),
            kpadding(),
            cardItem("Text", context, FlutterText.id),
            cardItem("Container", context, FlutterContainer.id),
          ]),
        ));
  }
}
