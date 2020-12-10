import 'package:flutter/material.dart';
import 'input_page.dart';
class resuableCard extends StatelessWidget {
  resuableCard({@required this.colour,this.childCard,this.onPress} );
  final Function onPress;
  final Color colour;
  final Widget childCard;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color:colour ,
            borderRadius:BorderRadius.circular(10)
        ),
      ),
    );
  }
}