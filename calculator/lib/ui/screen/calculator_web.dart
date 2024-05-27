import 'package:Calculator/ui/widget/function_button.dart';
import 'package:Calculator/ui/widget/number_button.dart';
import 'package:Calculator/ui/widget/segment_display.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CalculatorWeb extends StatelessWidget {
  const CalculatorWeb({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: CalculatorFrame(
                child: Column(
                  children: [
                    const CustomSegmentDisplay(),
                    Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomFunctionButton(funText: "M+"),
                        CustomFunctionButton(funText: "M-"),
                        CustomFunctionButton(funText: "MRC"),
                        CustomFunctionButton(funText: "GT"),
                        CustomFunctionButton(funText: "CE"),
                      ],
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: buildNumberGrid(numButtons)),
                          const Spacer(),
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
    );
  }

  GridView buildNumberGrid(List<String> buttons) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 20,
        childAspectRatio: 1.7,
      ),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        return CustomNumberButton(number: buttons[index]);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
      padding: const EdgeInsets.all(60),
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
