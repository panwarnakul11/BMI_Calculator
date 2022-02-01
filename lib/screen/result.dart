import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/screen/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ReturnPage extends StatelessWidget {
  ReturnPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toString(),
                    style: kResultText,
                  ),
                  Text(
                    bmiResult.toString(),
                    style: kBMIText,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kRemarkText,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              margin: EdgeInsets.all(5),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeFont,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
