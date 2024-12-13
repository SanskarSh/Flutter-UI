import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ticket_machine/src/ui/widget/draggable_widget.dart';

// Custom widget to create a draggable bank card carousel
class DraggableBankCardCarousel extends StatefulWidget {
  const DraggableBankCardCarousel({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.index = 0,
    required this.ctx,
  });

  // BuildContext to get media query size
  final BuildContext ctx;
  // Function to build each item in the carousel
  final Function(BuildContext context, int index) itemBuilder;
  // Total number of items in the carousel
  final int itemCount;
  // Initial index of the carousel
  final int index;

  @override
  State<DraggableBankCardCarousel> createState() =>
      _DraggableBankCardCarouselState();
}

class _DraggableBankCardCarouselState extends State<DraggableBankCardCarousel>
    with SingleTickerProviderStateMixin {
  // Size of the screen
  Size size = Size.zero;

  // Animation controller for the carousel animation
  late AnimationController controller;

  // Current index of the carousel
  late int index;

  // Direction of the drag
  DragDirection direction = DragDirection.down;

  // Handle the slide out event
  void onSlideOut(DragDirection newDirection) {
    direction = newDirection;
    controller.forward();
  }

  // Listener for the animation

  void animationListener() {
    if (controller.isCompleted) {
      setState(
        () {
          if (direction == DragDirection.down) {
            index = (index + 1) % widget.itemCount;
          } else {
            index = (index - 1 + widget.itemCount) % widget.itemCount;
          }
        },
      );
      controller.reset();
    }
  }

  // void animationListener() {
  //   if (controller.isCompleted) {
  //     setState(
  //       () {
  //         // Update the index based on the drag direction
  //         if (direction == DragDirection.down) {
  //           if (index == widget.itemCount - 1) {
  //             index = 0;
  //           } else {
  //             index++;
  //           }
  //           print("down");
  //           print(index);
  //         } else {
  //           if (index == 0) {
  //             index = widget.itemCount - 1;
  //           } else {
  //             index--;
  //           }
  //           print("up");
  //           print(index);
  //         }
  //       },
  //     );
  //     controller.reset();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // Initialize the index and the animation controller
    index = widget.index;
    controller = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    )..addListener(animationListener);
    // Get the screen size
    size = MediaQuery.of(widget.ctx).size;
  }

  @override
  void dispose() {
    controller
      ..removeListener(animationListener)
      ..dispose();
    super.dispose();
  }

  // Get the offset for each stack index
  // Offset getOffset(int stackIndex) {
  //   final curvedAnimation = CurvedAnimation(
  //     parent: controller,
  //     curve: Curves.linear,
  //   );

  //   if (direction == DragDirection.down) {
  //     return {
  //           0: Offset(
  //               0,
  //               lerpDouble(size.height * .22, size.height * .23,
  //                   curvedAnimation.value)!),
  //           1: Offset(
  //               0,
  //               lerpDouble(size.height * .24, size.height * .23,
  //                   curvedAnimation.value)!),
  //           2: Offset(
  //               0,
  //               lerpDouble(size.height * .25, size.height * .24,
  //                   curvedAnimation.value)!),
  //         }[stackIndex] ??
  //         Offset(
  //             0,
  //             size.height * .26 +
  //                 (size.height * .5 * curvedAnimation.value * 1));
  //   } else {
  //     return {
  //           0: Offset(
  //               0,
  //               lerpDouble(size.height * .22, size.height * .23,
  //                   curvedAnimation.value * -.01)!),
  //           1: Offset(
  //               0,
  //               lerpDouble(size.height * .24, size.height * .23,
  //                   curvedAnimation.value * -.01)!),
  //           2: Offset(
  //               0,
  //               lerpDouble(size.height * .25, size.height * .24,
  //                   curvedAnimation.value * -.01)!),
  //         }[stackIndex] ??
  //         Offset(0,
  //             size.height * .26 + (size.height * curvedAnimation.value * -.01));
  //   }
  // }

  // double getScale(int stackIndex) {
  //   final curvedAnimation = CurvedAnimation(
  //     parent: controller,
  //     curve: Curves.linear,
  //   );

  //   if (direction == DragDirection.down) {
  //     return {
  //           0: lerpDouble(0, 1.2, curvedAnimation.value)!,
  //           1: lerpDouble(1.3, 1.4, curvedAnimation.value)!,
  //           2: lerpDouble(1.4, 1.5, curvedAnimation.value)!,
  //         }[stackIndex] ??
  //         1.5;
  //   } else {
  //     return {
  //           0: lerpDouble(0, 0, -curvedAnimation.value * .01)!,
  //           1: lerpDouble(1.3, 0, -curvedAnimation.value * .01)!,
  //           2: lerpDouble(1.4, 1.3, -curvedAnimation.value * .01)!,
  //         }[stackIndex] ??
  //         lerpDouble(1.5, 1.4, -curvedAnimation.value * .01)!;
  //   }
  // }

  Offset getOffset(int stackIndex) {
    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    if (direction == DragDirection.down) {
      return {
            0: Offset(
              0,
              lerpDouble(
                  size.height * .22, size.height * .23, curvedAnimation.value)!,
            ),
            1: Offset(
              0,
              lerpDouble(
                  size.height * .24, size.height * .23, curvedAnimation.value)!,
            ),
            2: Offset(
              0,
              lerpDouble(
                  size.height * .25, size.height * .24, curvedAnimation.value)!,
            ),
          }[stackIndex] ??
          Offset(
            0,
            size.height * .26 + (size.height * .5 * curvedAnimation.value * 1),
          );
    } else {
      return {
            0: Offset(
              0,
              lerpDouble(size.height * .22, size.height * .23,
                  curvedAnimation.value * -0.01)!,
            ),
            1: Offset(
              0,
              lerpDouble(size.height * .24, size.height * .23,
                  curvedAnimation.value * -0.01)!,
            ),
            2: Offset(
              0,
              lerpDouble(size.height * .25, size.height * .24,
                  curvedAnimation.value * -0.01)!,
            ),
          }[stackIndex] ??
          Offset(
            0,
            size.height * .26 +
                (size.height * .3 * curvedAnimation.value * -.1),
          );
    }
  }

  double getScale(int stackIndex) {
    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    if (direction == DragDirection.down) {
      return {
            0: lerpDouble(0, 1.2, curvedAnimation.value)!,
            1: lerpDouble(1.3, 1.4, curvedAnimation.value)!,
            2: lerpDouble(1.4, 1.5, curvedAnimation.value)!,
          }[stackIndex] ??
          1.5;
    } else {
      return {
            0: lerpDouble(0, 0, curvedAnimation.value * -0.01)!,
            1: lerpDouble(1.3, 0, curvedAnimation.value * -0.01)!,
            2: lerpDouble(1.4, 1.3, curvedAnimation.value * -0.01)!,
          }[stackIndex] ??
          lerpDouble(1.5, 1.4, curvedAnimation.value * -0.01)!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Stack(
          children: List.generate(
            4,
            (stackIndex) {
              // Calculate the index for each stack item
              final modIndex = (index + 3 - stackIndex) % widget.itemCount;
              return DraggableWidget(
                onSlideOut: onSlideOut,
                isDraggable: stackIndex == 3,
                child: Transform.translate(
                  offset: getOffset(stackIndex),
                  child: Transform.scale(
                    alignment: const Alignment(0, -.5),
                    scale: getScale(stackIndex),
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: widget.itemBuilder(context, modIndex),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
