import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

ResponsiveGridCol cardTitle(String title) {
  return ResponsiveGridCol(
      child: Center(
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 42, fontWeight: FontWeight.w100, color: Colors.orange),
    ),
  ));
}
