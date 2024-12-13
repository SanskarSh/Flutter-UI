import 'package:flutter/material.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:qpay/src/features/statistics/model/bar.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    final step = 1 / bars.length;
    _animations = List.generate(
      bars.length,
      (index) {
        final start = index * step;
        final end = start + step;

        return Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
        );
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        bars.length,
        (index) => AnimatedBarItem(
          bar: bars[index],
          animation: _animations[index],
        ),
      ),
    );
  }
}

class AnimatedBarItem extends StatelessWidget {
  final Bar bar;
  final Animation<double> animation;
  static const int maxValue = 7;

  const AnimatedBarItem({
    super.key,
    required this.bar,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Column(
          children: [
            Container(
              height: 160,
              width: 35,
              decoration: BoxDecoration(
                color: tertiaryColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Spacer(flex: bar.value),
                  Expanded(
                    flex: maxValue - bar.value,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                          height: 160 *
                              (maxValue - bar.value) /
                              maxValue *
                              animation.value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              bar.day,
              style: TextStyle(
                color: tertiaryColor,
                fontSize: 16,
              ),
            ),
          ],
        );
      },
    );
  }
}
