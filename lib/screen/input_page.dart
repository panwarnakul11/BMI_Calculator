import 'package:bmi_calculator/brain.dart';

import '../icon_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusable_card.dart';
import '../constant.dart';
import 'package:bmi_calculator/screen/result.dart';
import 'package:bmi_calculator/brain.dart';

enum gender {
  male,
  female,
}
int height = 180;
int weight = 69;
int age = 20;

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                      colour: selectedGender == gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.female;
                        });
                      },
                      colour: selectedGender == gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kDigitStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kBottomContainerColor,
                        thumbColor: kBottomContainerColor,
                        overlayColor: Color(0x15ffffff),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12.0,
                          pressedElevation: 8.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        divisions: 200,
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 100.0,
                        max: 300.0,
                        inactiveColor: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kDigitStyle,
                              ),
                              Text(
                                'kg',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                press: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 15.0),
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.plus,
                                press: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: kDigitStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButtonIcon(
                                  icon: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.plus,
                                press: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Brain calc = Brain(wt: weight, ht: height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReturnPage(
                              bmiResult: calc.CalculateBMI(),
                              resultText: calc.Results(),
                              interpretation: calc.Remark(),
                            )));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kLargeFont,
                  ),
                ),
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            )
          ],
        ));
  }
}

class RoundButtonIcon extends StatelessWidget {
  RoundButtonIcon({this.icon, this.press});
  final IconData? icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press,
      child: Icon(icon),
      fillColor: Colors.grey[600],
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
