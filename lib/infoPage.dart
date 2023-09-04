import 'package:flutter/material.dart';
import 'card_Widget.dart';
import 'vData.dart';
import 'bottom.dart';

class infoPage extends StatelessWidget {
  const infoPage(
      {super.key,
        required this.interpretation,
        required this.bmiResult,
        required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR APP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Resultados: ',
                style: vTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: AwesomeCard(
              color: vActiveCardColour,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: vResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: vBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: vBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Atras',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}