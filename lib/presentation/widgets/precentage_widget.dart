import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../config/theme/sizes_manager.dart';


class PercentageWidget extends StatelessWidget {
  final Color color;
  final double percent;

  const PercentageWidget({
    super.key,
    required this.percent,
    required this.color,
  });
  String getStatePercentage() {
    return ((percent * 100) % 1 == 0)
        ? (percent * 100).toInt().toString()
        : (percent * 100).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.size70,
      height: Sizes.size60,
      child: FittedBox(
        child: CircularPercentIndicator(
          radius: 400.0,
          lineWidth: 60,
          progressColor: color,
          backgroundColor: const Color(0xDCDCDCDC),
          percent: percent % 100,
          center: Padding(
            padding: const EdgeInsets.all(30),
            child: FittedBox(
              child: Text(
                "${getStatePercentage()}%",
                style: const TextStyle(
                  fontSize: 140,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
