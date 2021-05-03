import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icons_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  colour: selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
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
                  colour: selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
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
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",style: kGenderTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                    style:kNumberTextStyle,
                    ),
                    Text('cm',style: kGenderTextStyle,),
                  ],
                ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor:Color(0xFFEB1555) ,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(value: height.toDouble(),
                        min:120.0,
                        max:220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                      setState(() {
                        height = newValue.round() ;
                      });
                        }),
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ResusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                          style: kGenderTextStyle
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                            setState(() {
                              weight--;
                            });
                            },
                          ),

                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ResusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: kGenderTextStyle,),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                            setState(() {
                              age--;
                            });
                              }),
                          SizedBox(
                            width :10.0
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',
          onTap :(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage())
            );
          },),
        ],
      ),
    );
  }
}



