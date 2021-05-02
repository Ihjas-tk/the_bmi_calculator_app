import 'package:flutter/material.dart';

const genderTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));


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
          style:genderTextStyle
        ),
      ],
    );
  }
}