import 'package:flutter/material.dart';

// Enum to represent drag directions
enum DragDirection { up, down }

// Custom widget to allow child widget to be draggable
class DraggableWidget extends StatefulWidget {
  const DraggableWidget({
    super.key,
    required this.child,
    this.onSlideOut,
    this.onPressed,
    required this.isDraggable,
  });

  // The child widget that will be draggable
  final Widget child;
  // Callback function to be called when the widget slides out
  final ValueChanged<DragDirection>? onSlideOut;
  // Callback function to be called when the widget is pressed
  final VoidCallback? onPressed;
  // Boolean to indicate if the widget is draggable
  final bool isDraggable;

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget>
    with SingleTickerProviderStateMixin {
  // Screen size
  late Size screenSize;
  // Animation controller to restore the widget to its original position
  late AnimationController restoreController;

  // Global key to get the size and position of the child widget
  final _widgetKey = GlobalKey();
  // Offset to store the starting point of the drag
  Offset _startOffset = Offset.zero;
  // Offset to store the current position of the drag
  Offset _panOffset = Offset.zero;

  // Size of the child widget
  Size size = Size.zero;

  // Boolean to check if the widget is slid out
  bool get isSlideOut => _panOffset.dy < -size.height * 0.3;
  // Boolean to check if a slide has been made
  bool isSlideMade = false;

  // Offset to determine the slide out distance
  double get slideOutOffset => size.height * .3;

  // Handle the start of the drag
  void onPanStart(DragStartDetails details) {
    if (!restoreController.isAnimating) {
      if (!widget.isDraggable) return;
      setState(() {
        _startOffset = details.globalPosition;
      });
    }
  }

  // Handle the update of the drag
  // void onPanUpdate(DragUpdateDetails details) {
  //   if (!restoreController.isAnimating) {
  //     if (!widget.isDraggable) return;

  //     setState(() {
  //       // Drag freely
  //       // _panOffset = details.globalPosition - _startOffset;

  //       // Drag vertically only
  //       _panOffset = Offset(0, details.globalPosition.dy - _startOffset.dy);
  //     });
  //   }
  // }

  // Handle the update of the drag
  void onPanUpdate(DragUpdateDetails details) {
    if (!restoreController.isAnimating) {
      if (!widget.isDraggable) return;

      setState(() {
        // Determine the direction of the swipe
        if (details.delta.dy < 0) {
          // Swiping up
        } else {
          // Dragging down
          _panOffset = Offset(0, details.globalPosition.dy - _startOffset.dy);
        }
      });
    }
  }

  // Handle the end of the drag
  void onPanEnd(DragEndDetails details) {
    if (restoreController.isAnimating) return;

    final velocityY = details.velocity.pixelsPerSecond.dy;
    final positionY = currentPosition.dy;

    // Slide out conditions
    if (velocityY < -200 || positionY < -slideOutOffset) {
      isSlideMade = widget.onSlideOut != null;
      widget.onSlideOut?.call(DragDirection.up);
    }
    if (velocityY > 500 || positionY > (screenSize.height - slideOutOffset)) {
      isSlideMade = widget.onSlideOut != null;
      widget.onSlideOut?.call(DragDirection.down);
    }
    restoreController.forward();
  }

  // Listener for the restore animation
  void restoreAnimationListener() {
    if (restoreController.isCompleted) {
      restoreController.reset();
      _panOffset = Offset.zero;
      isSlideMade = false;
      setState(() {});
    }
  }

  // Get the current position of the child widget
  Offset get currentPosition {
    final renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  // Get the size of the child widget
  void getChildSize() {
    size =
        (_widgetKey.currentContext?.findRenderObject() as RenderBox?)?.size ??
            Size.zero;
  }

  @override
  void initState() {
    restoreController =
        AnimationController(vsync: this, duration: kThemeAnimationDuration)
          ..addListener(restoreAnimationListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenSize = MediaQuery.of(context).size;
      getChildSize();
    });
    super.initState();
  }

  @override
  void dispose() {
    restoreController
      ..removeListener(restoreAnimationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(key: _widgetKey, child: widget.child);

    if (!widget.isDraggable) return child;

    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: AnimatedBuilder(
        animation: restoreController,
        builder: (context, child) {
          final value = 1 - restoreController.value;
          return Transform.translate(
            offset: _panOffset * value / 2,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
