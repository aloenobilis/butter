import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_outlined,
        color: Colors.orange,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(title),
  );
}
