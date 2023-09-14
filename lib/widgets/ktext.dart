import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

ResponsiveGridCol ktext(String text) {
  return ResponsiveGridCol(
      child: Center(
    child: SizedBox(
      width: 750,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    ),
  ));
}
