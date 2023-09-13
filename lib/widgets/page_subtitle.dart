import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

ResponsiveGridCol cardSubtitle(String title) {
  return ResponsiveGridCol(
      child: Container(
    decoration: const BoxDecoration(color: Colors.black26, border: Border()),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w100, color: Colors.orange),
      ),
    ),
  ));
}
