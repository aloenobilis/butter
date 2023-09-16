import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:animations/animations.dart';

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper(
      {required this.closedBuilder,
      required this.transitionType,
      required this.screen});

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      closedColor: Colors.transparent,
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return screen;
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}

ResponsiveGridCol cardItem(String title, BuildContext context, Widget screen) {
  return ResponsiveGridCol(
    xs: 6,
    md: 3,
    lg: 2,
    xl: 1,
    child: _OpenContainerWrapper(
      screen: screen,
      transitionType: ContainerTransitionType.fade,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
                color: Colors.orange, border: Border(), shape: BoxShape.circle),
            child: Card(
              elevation: 10,
              child: SizedBox(
                // width: 100,
                // height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w100,
                            fontSize: 16),
                      ),
                      ElevatedButton(
                          onPressed: openContainer,
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
      },
    ),
  );
}
