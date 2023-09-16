import 'package:butter/widgets/app_bar.dart';
import 'package:butter/widgets/code_item.dart';
import 'package:butter/widgets/kpadding.dart';
import 'package:butter/widgets/ktext.dart';
import 'package:butter/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 10;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 10;

    // Path() moves the pointer
    var path = Path();

    path.moveTo(0, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.9,
        size.width * 0.5, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.2);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class FlutterCustomPaint extends StatelessWidget {
  static const id = "flutter_custom_paint";
  const FlutterCustomPaint({super.key});

  final codeLine = '''
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

SizedBox(
  width: 300,
  height: 100,
  child: CustomPaint(
    // size: const Size(450, 50),
    painter: LinePainter(),
    child: const Center(
        child: Text(
      'Over',
      style: TextStyle(fontSize: 26, color: Colors.black54),
    )),
  ),
),
''';

  final codeLineUnder = '''
Center(
  child: CustomPaint(
    foregroundPainter: LinePainter(),
    child: Container(
      color: Colors.blueAccent,
      width: 300,
      height: 100,
      child: const Center(
          child: Text(
        'Under',
        style: TextStyle(fontSize: 26, color: Colors.black54),
      )),
    ),
  ),
),
''';

  final codeCircle = '''
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 10;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Center(
  child: CustomPaint(
    size: const Size(450, 200),
    painter: CirclePainter(),
  ),
)
''';

  final codeCurved = '''
class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 10;

    // Path() moves the pointer
    var path = Path();

    path.moveTo(0, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.9,
        size.width * 0.5, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.2);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Center(
  child: CustomPaint(
    size: const Size(450, 200),
    painter: CurvedPainter(),
  ),
)
''';

  ResponsiveGridCol line() {
    return ResponsiveGridCol(
        child: Center(
      child: SizedBox(
        width: 300,
        height: 100,
        child: CustomPaint(
          // size: const Size(450, 50),
          painter: LinePainter(),
          child: const Center(
              child: Text(
            'Over',
            style: TextStyle(fontSize: 26, color: Colors.black54),
          )),
        ),
      ),
    ));
  }

  ResponsiveGridCol lineOnTopOfContainer() {
    return ResponsiveGridCol(
        child: Center(
      child: CustomPaint(
        foregroundPainter: LinePainter(),
        child: Container(
          color: Colors.blueAccent,
          width: 300,
          height: 100,
          child: const Center(
              child: Text(
            'Under',
            style: TextStyle(fontSize: 26, color: Colors.black54),
          )),
        ),
      ),
    ));
  }

  ResponsiveGridCol circle() {
    return ResponsiveGridCol(
        child: Center(
      child: CustomPaint(
        size: const Size(450, 200),
        painter: CirclePainter(),
      ),
    ));
  }

  ResponsiveGridCol curved() {
    return ResponsiveGridCol(
        child: Center(
      child: CustomPaint(
        size: const Size(450, 200),
        painter: CurvedPainter(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Flutter: CustomPaint"),
        body: SingleChildScrollView(
          child: ResponsiveGridRow(children: [
            cardTitle("CustomPaint"),
            kpadding(),
            ktext(
                "A widget that provides a canvas on which to draw during the paint phase. When asked to paint, CustomPaint first asks its painter to paint on the current canvas, then it paints its child, and then, after painting its child, it asks its foregroundPainter to paint. "),
            kpadding(),
            ktext("Drawing a line with text over"),
            kpadding(),
            codeItemGridCol(codeLine),
            line(),
            kpadding(),
            ktext("Drawing a line with children under using foregroundPainter"),
            kpadding(),
            codeItemGridCol(codeLineUnder),
            kpadding(),
            lineOnTopOfContainer(),
            kpadding(),
            ktext("Drawing a circle"),
            kpadding(),
            codeItemGridCol(codeCircle),
            kpadding(),
            circle(),
            kpadding(),
            ktext("Drawing a curved path"),
            kpadding(),
            codeItemGridCol(codeCurved),
            kpadding(),
            curved(),
            kpadding(),
            kpadding(),
            kpadding(),
            kpadding(),
          ]),
        ));
  }
}
