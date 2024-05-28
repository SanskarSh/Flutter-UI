import 'package:Calculator/ui/widget/function_button.dart';
import 'package:Calculator/ui/widget/number_button.dart';
import 'package:Calculator/ui/widget/segment_display.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CalculatorWeb extends StatelessWidget {
  const CalculatorWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
          child: Center(
            child: CalculatorFrame(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: CustomSegmentDisplay(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: buildPanel(context),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomFunctionButton(funText: "M+"),
                                    CustomFunctionButton(funText: "M-"),
                                    CustomFunctionButton(funText: "MRC"),
                                  ],
                                ),
                                Expanded(child: buildNumberGrid()),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomFunctionButton(funText: "GT"),
                                            CustomFunctionButton(funText: "/"),
                                            CustomFunctionButton(funText: "X"),
                                            CustomFunctionButton(funText: "-"),
                                            SizedBox()
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          // child: buildPlusButton(context),
                                          child: CustomFunctionButton(
                                        funText: "+",
                                        isActionBtn: true,
                                        isActionBtnBig: true,
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomFunctionButton(funText: "CE"),
                                            CustomFunctionButton(funText: "▸"),
                                            CustomFunctionButton(funText: "%"),
                                            CustomFunctionButton(funText: "MU"),
                                            SizedBox()
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: CustomFunctionButton(
                                        funText: "=",
                                        isActionBtnBig: true,
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stack buildPanel(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipPath(
          clipper: CustomClipperPath(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.primary.withOpacity(.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                  inset: true,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.6),
                          blurRadius: 5,
                          spreadRadius: .5,
                          inset: true,
                          offset: const Offset(0, -15),
                        )
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 1,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 1,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 1,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CASINO",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                      Text(
                        "-- CSN-220320",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomFunctionButton(
                funText: "ON",
                isActionBtn: true,
              )
            ],
          ),
        ),
      ],
    );
  }

  ScrollConfiguration buildNumberGrid() {
    final List<String> numButtons = [
      "7",
      "8",
      "9",
      "4",
      "5",
      "6",
      "1",
      "2",
      "3",
      "00",
      "0",
      "."
    ];
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 20,
          childAspectRatio: 1.42,
        ),
        itemCount: numButtons.length,
        itemBuilder: (context, index) {
          return CustomNumberButton(number: numButtons[index]);
        },
        shrinkWrap: true,
      ),
    );
  }
}

class CalculatorFrame extends StatelessWidget {
  final Widget child;
  const CalculatorFrame({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 840,
      width: 690,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.4),
            blurRadius: 80,
            spreadRadius: 20,
            offset: const Offset(0, 20),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(.4),
            blurRadius: 10,
            spreadRadius: 1,
            inset: true,
            offset: const Offset(-4, 15),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.8),
            blurRadius: 10,
            spreadRadius: 1,
            inset: true,
            offset: const Offset(4, -15),
          ),
        ],
      ),
      child: child,
    );
  }
}

class NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, h);
    path.lineTo(w * .55, h);
    path.lineTo(w * .8, h * .3);
    path.lineTo(w, h * .3);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
