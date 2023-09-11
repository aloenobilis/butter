import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

ResponsiveGridCol cardItem(String title, BuildContext context, Widget screen) {
  return ResponsiveGridCol(
    xs: 2,
    md: 2,
    lg: 2,
    child: Card(
      elevation: 10,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(title),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => screen));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  child: const Text(
                    "View",
                    style: TextStyle(color: Colors.black54),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
