import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/colors.dart';

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isActive ? ProjectColors.mainBlue : Colors.white38,
        shape: BoxShape.circle,
      ),
    );
  }
}
