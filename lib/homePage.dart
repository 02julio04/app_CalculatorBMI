import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_bmi/bottom.dart';
import 'calculator_brain.dart';
import 'vData.dart';
import 'icon_content.dart';
import 'infoPage.dart';
import 'card_Widget.dart';


enum Gender {
  male,
  female,
}

class homePage extends StatefulWidget {
  const homePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<homePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<homePage> {
  Gender? selectedGender;
  late int height;
  late int weight;
  late int age;

  @override
  void initState() {
    super.initState();
    selectedGender = null;
    height = 120;
    weight = 65;
    age = 18;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AwesomeCard(
                  color: selectedGender == Gender.male
                      ? vActiveCardColour
                      : vInactiveCardColour,
                  icon: const IconContent(
                      icon: FontAwesomeIcons.mars, label: 'MALE'),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
                AwesomeCard(
                  color: selectedGender == Gender.female
                      ? vActiveCardColour
                      : vInactiveCardColour,
                  icon: const IconContent(
                      icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AwesomeCard(
                  color: vInactiveCardColour,
                  icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: vLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: vNumberTextStyle,
                            ),
                            const Text(
                              'cm',
                              style: vLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color.fromARGB(255, 123, 124, 132),
                            activeTrackColor: Colors.white,
                            thumbColor: Color.fromARGB(255, 66, 92, 219),
                            overlayColor: Color.fromARGB(0, 0, 0, 0),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                            min: 120,
                            max: 220,
                            value: height.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                          ),
                        )
                      ]),
                  onPress: () {},
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AwesomeCard(
                  color: vInactiveCardColour,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: vLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: vNumberTextStyle,
                          ),
                          const Text(
                            'kg',
                            style: vLabelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyWeightButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                if (weight == 0) return;

                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          MyWeightButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                if (weight == 300) return;
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  onPress: () {},
                ),
                AwesomeCard(
                  color: vInactiveCardColour,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: vLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: vNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyWeightButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                if (age == 18) return;

                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          MyWeightButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                if (age == 100) return;

                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  onPress: () {},
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calcular',
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => infoPage(
                    bmiResult: calc.getBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyWeightButton extends StatelessWidget {
  MyWeightButton({super.key, required this.icon, required this.onPress});

  IconData icon;
  void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0.0,
        onPressed: onPress,
        constraints: const BoxConstraints.tightFor(height: 56.0, width: 56.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Color.fromARGB(255, 66, 92, 219),
        child: Icon(icon));
  }
}