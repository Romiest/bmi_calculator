import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Resuable_card.dart';
import 'Icon_content.dart';
import 'constants.dart';
import 'Results_Page.dart';
import 'BMI_Brain.dart';
import 'Bottom_Button.dart';

enum Gender{
  Male,
  Female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
Gender selectedGender;

int height=180;
int weight=35;
int age=12;


  @override
  Widget build(BuildContext context) {
    Expanded cont(){
       return Expanded(
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color:kActiveCardColor ,
              borderRadius:BorderRadius.circular(10)
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
     children: <Widget>[
Expanded(
  child:Row(
    children:<Widget>[    Expanded(
      child: resuableCard(onPress:(){
        setState(() {

          selectedGender=Gender.Male;
        });
      },
        colour:
        selectedGender==Gender.Male?kActiveCardColor:kInactiveCardColor
        ,
        childCard:
      gender(FontAwesomeIcons.mars,"Male"),
      ),
    ),
      Expanded(
        child: resuableCard(
            onPress:  (){
              setState(() {
                selectedGender=Gender.Female;
              });

            },
            colour:
            selectedGender==Gender.Female?kActiveCardColor:kInactiveCardColor
            , childCard:gender(FontAwesomeIcons.venus, "FEMALE")
        ),

      ),
      ]
  ),
),
       Expanded(
        child: Row(
          children: <Widget>[
    Expanded(
    child: resuableCard(colour:kActiveCardColor,childCard:Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Text('HEIGHT',
          style: kIconLabelcontent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              height.toString(),
              style:kBodySpecs,
            ),
            Text(
              'cm',
              style: kIconLabelcontent,
            )
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            inactiveTrackColor:Color(0xFF8D8E98) ,
            activeTrackColor:Colors.white,
            thumbColor: Color(0xFFEB1555),
            overlayColor:Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius:15),
            overlayShape:RoundSliderOverlayShape(overlayRadius:30),
          ),

          child: Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 220.0,

            onChanged: (double newValue){
       setState(() {
           height=newValue.round();
       });
            },
          ),
        )
      ],
    )),

    ),
          ],
        ),
       ),
       Expanded(
child: Row(
  children: <Widget>[
    Expanded(
      child: resuableCard(colour:kActiveCardColor,childCard:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text("WEIGHT",style: kIconLabelcontent,),
          Text(weight.toString(),style: kBodySpecs,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           RoundIconButton(icon:FontAwesomeIcons.minus,onPressed: (){
             setState(() {
               weight--;
             });
           },
           ),
              SizedBox(
                width: 13,
              ),
              RoundIconButton(icon:FontAwesomeIcons.plus,onPressed: (){
                setState(() {
                  weight++;
                });
              },),
            ],
          )

        ],
      )),

    ),
    Expanded(
      child:resuableCard(colour:kActiveCardColor,childCard:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('AGE',
            style: kIconLabelcontent,
          ),
          Text(
            age.toString(),
            style: kBodySpecs,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: (){
                  setState(() {
                    age--;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: (){
                  setState(() {
                    age++;
                  });
                },
              ),
            ],
          )

        ],
      )),

    ),
  ],
),
       ),
BottomButton(
  onTap: (){
Brain calc=Brain(weight: weight,height: height);
    Navigator.push(context, MaterialPageRoute(builder:(context){



      return ResultPage(
       bmiResult: calc.Calculate(),
        result: calc.getResult(),
        interp: calc.interp(),
      );

    },),);

  },
  text: 'CALCULATE',
)

     ],

 ),






    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      child:Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E) ,
    );
  }
}

