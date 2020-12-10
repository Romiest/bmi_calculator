import 'package:flutter/material.dart';
import 'constants.dart';
class gender extends StatelessWidget {
  gender(this.icon,this.word);
  final IconData icon;
  final String word;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          word,
          style: kIconLabelcontent,


        )
      ],
    );
  }
}