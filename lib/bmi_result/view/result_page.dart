import 'package:bmi_calculator/common/common.dart';
import 'package:bmi_calculator/utils/utils.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText!.toUpperCase(),
                    style: kResultTextStyle,
                    key: const Key('resultPage_text'),
                  ),
                  Text(
                    bmiResult!,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation!,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            key: const Key('resultPage_bottomButton'),
            buttonTitle: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
