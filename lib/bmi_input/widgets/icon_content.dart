import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const IconContent({
    required this.label,
    required this.icon,
  });

  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label!,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
