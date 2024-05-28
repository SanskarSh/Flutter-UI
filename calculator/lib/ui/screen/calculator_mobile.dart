import 'package:Calculator/ui/screen/calculator_web.dart';
import 'package:Calculator/ui/widget/function_button.dart';
import 'package:Calculator/ui/widget/number_button.dart';
import 'package:Calculator/ui/widget/segment_display.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CalculatorMobile extends StatelessWidget {
  const CalculatorMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomSegmentDisplay(),
              const Spacer(),
              SizedBox(
                height: 140,
                child: buildPanel(context),
              ),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomFunctionButton(funText: "M+")),
                                SizedBox(width: 15),
                                Expanded(
                                    child: CustomFunctionButton(funText: "M-")),
                                SizedBox(width: 15),
                                Expanded(
                                    child:
                                        CustomFunctionButton(funText: "MRC")),
                              ],
                            ),
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
                                  ),
                                ),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
              const SizedBox(height: 50)
            ],
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
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    width: 120,
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
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CASINO",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "-- CSN-220320",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 10,
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
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
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
