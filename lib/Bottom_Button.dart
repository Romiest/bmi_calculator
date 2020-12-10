import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.text});
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return     GestureDetector(

      onTap: onTap,

      child:   Container(

        padding: EdgeInsets.only(bottom: 10),



        child: Center(child: Text(text,style: kLargelowerContainer,

        )),



        color: Color(0xFFEB1555),



        margin: EdgeInsets.only(top: 10),



        width: double.infinity,



        height: kContainerHeight,















      ),

    );
  }
}