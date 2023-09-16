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
import 'package:butter/screens/flutter_animation_2.dart';
import 'package:butter/screens/flutter_color.dart';
import 'package:butter/screens/flutter_container.dart';
import 'package:butter/screens/flutter_animation.dart';
import 'package:butter/screens/flutter_custom_paint.dart';
import 'package:butter/screens/flutter_navigator.dart';
import 'package:butter/screens/flutter_stream_builder.dart';
import 'package:butter/screens/flutter_text.dart';
import 'package:butter/screens/flutter_text_field.dart';
import 'package:butter/widgets/card_item.dart';
import 'package:butter/widgets/circle.dart';
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
  List<Widget> get _backgroundCircles => const [
        Circle(
          color1: Color.fromARGB(255, 116, 75, 0),
          color2: Colors.orange,
          radius: 150,
          right: -30,
          bottom: 200,
        ),
        Circle(
          color1: Color.fromARGB(255, 150, 90, 0),
          color2: Colors.orange,
          radius: 200,
          left: -100,
          bottom: -80,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ..._backgroundCircles,
          Positioned.fill(
            child: SingleChildScrollView(
              child: ResponsiveGridRow(children: [
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
                cardItem("Regex", context, const DartRegex()),
                kpadding(),
                cardTitle("Flutter"),
                kpadding(),
                cardItem("Text", context, const FlutterText()),
                cardItem("Color", context, const FlutterColor()),
                cardItem("Container", context, const FlutterContainer()),
                cardItem("Text Field", context, const FlutterTextField()),
                cardItem(
                    "Stream Builder", context, const FlutterStreamBuilder()),
                cardItem("Animation", context, const FlutterAnimation()),
                cardItem("Animation 2", context, const FlutterAnimation2()),
                cardItem("Navigator", context, const FlutterNavigator()),
                cardItem("CustomPaint", context, const FlutterCustomPaint()),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
