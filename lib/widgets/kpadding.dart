import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

ResponsiveGridCol kpadding() {
  return ResponsiveGridCol(
      child: const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
  ));
}
