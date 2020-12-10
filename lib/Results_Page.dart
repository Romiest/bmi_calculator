import 'package:flutter/material.dart';
import 'constants.dart';
import 'Resuable_card.dart';
import 'Bottom_Button.dart';
import 'BMI_Brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.interp,@required this.bmiResult,@required this.result});
  final String interp;
  final String bmiResult;
  final String result;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR') ,

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:Container(
            padding: EdgeInsets.only(top: 15),
              child: Text('YOUR RESULT',style: kBodySpecs,))),
          Expanded(
            flex: 5,
          child:resuableCard(colour: kActiveCardColor,childCard: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(result.toUpperCase(),
              style: kResultStyle,
              ),
              Text(
              bmiResult,
                style: kResultBMI,

              ),
              Text(interp,style: kBodyText
                ,
              textAlign: TextAlign.center,)
            ],
          ),) ,
              ),
          Expanded(
            child: BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
              text: "RECALCULATE",
            ),
          )

        ],
      ) ,
    );
  }
}
