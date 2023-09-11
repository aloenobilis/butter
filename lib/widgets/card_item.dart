import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

ResponsiveGridCol cardItem(String title, BuildContext context, Widget screen) {
  return ResponsiveGridCol(
    xs: 6,
    md: 3,
    lg: 2,
    xl: 1,
    child: Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
          color: Colors.amber, border: Border(), shape: BoxShape.circle),
      child: Card(
        elevation: 10,
        child: SizedBox(
          // width: 100,
          // height: 100,
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
    ),
  );
}
