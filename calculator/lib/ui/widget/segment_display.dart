import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:segment_display/segment_display.dart';

class CustomSegmentDisplay extends StatelessWidget {
  const CustomSegmentDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.4),
              blurRadius: 10,
              spreadRadius: 1,
              inset: true)
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(.9),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: FittedBox(
            child: SevenSegmentDisplay(
              value: "1.234.567.901.23",
              backgroundColor: Colors.transparent,
              segmentStyle: HexSegmentStyle(
                disabledColor: Colors.black.withOpacity(.08),
                enabledColor: Colors.black,
              ),
              size: 6,
            ),
          ),
        ),
      ),
    );
  }
}
