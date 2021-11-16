import 'package:flutter/material.dart';

import 'package:bmi_calculator/bmi_input/view/input_page.dart';
import 'package:bmi_calculator/utils/utils.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0D22),
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: kGreyColor,
          overlayColor: const Color(0x29EB1555),
          thumbColor: kBottomContainerColor,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 24.0,
          ),
        ),
      ),
    );
  }
}
