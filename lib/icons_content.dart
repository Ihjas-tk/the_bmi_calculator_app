import 'package:flutter/material.dart';
import 'constants.dart';



class IconContent extends StatelessWidget {
  IconContent({@required this.gender,this.genderSymbols});
  final IconData genderSymbols;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(genderSymbols, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style:kGenderTextStyle
        ),
      ],
    );
  }
}