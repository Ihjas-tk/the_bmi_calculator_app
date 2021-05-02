import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor =Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  Gender selectedGender;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ResusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender==Gender.male?activeCardColor:inactiveCardColor,
                  cardChild: IconContent(
                    genderSymbols: FontAwesomeIcons.mars,
                    gender:'Male',
                  ),
                ),
              ),
              Expanded(
                child: ResusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender==Gender.female?activeCardColor:inactiveCardColor,
                  cardChild: IconContent(
                    genderSymbols: FontAwesomeIcons.venus,
                    gender: 'Female',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ResusableCard(
              colour: activeCardColor,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ResusableCard(
                  colour: activeCardColor,
                ),
              ),
              Expanded(
                child: ResusableCard(
                  colour: activeCardColor,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}



