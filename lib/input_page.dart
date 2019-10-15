

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';
import 'reusable_card.dart';
import 'round_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }
const TextStyle kNumberLabelTextStyle=TextStyle(fontSize: 42,fontWeight: FontWeight.bold);
const TextStyle kLabelTextStyle =TextStyle(fontSize: 22,
color: Colors.grey,
fontWeight: FontWeight.bold,
letterSpacing: 1);
class Data {
  int height;
  int weight;
  Data({this.height, this.weight});
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  Color activeCardColor = Color(0xFF1D1F31);
  Color inactiveCardColor = Color(0xFF111328);
  TextStyle inactiveTextStyle = TextStyle(fontSize: 24, color: Colors.white60);
  TextStyle activeTextStyle = TextStyle(fontSize: 24, color: Colors.white);
  Color activeTextColor = Colors.white;
  Color inactiveTextColor = Colors.white60;
  int height = 183;
  int weight=63;
  int age=19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars,
                            size: 100,
                            color: gender == Gender.male
                                ? activeTextColor
                                : inactiveTextColor),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: gender == Gender.male
                              ? activeTextStyle
                              : inactiveTextStyle,
                        )
                      ],
                    ),
                    color: gender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    // if(gender== 0){
                    // return activeCardColor;
                    // } else{
                    // return inavctiveCardColor
                    //}
                    tapCallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                      print('Male selected');
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                          color: gender == Gender.female
                              ? activeTextColor
                              : inactiveTextColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: gender == Gender.female
                              ? activeTextStyle
                              : inactiveTextStyle,
                        )
                      ],
                    ),
                    color: gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });

                      print('Female selected');
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberLabelTextStyle,),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25.0,
                      ),
                      thumbColor: Color(0XFFEB1555),
                      overlayColor: Color(0X29EB1555),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      min: 110,
                      max: 210,
                      value: height.toDouble(),
                      inactiveColor: Color(0XFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child:  Column(
                      children: <Widget>[
                        Text('Weight',style: kLabelTextStyle,),
                        Text('$weight',style: kNumberLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            RoundButton(
                              icon:Icon(Icons.remove,size:32,),
                              callback: () {
                                setState(() {
                                  weight=weight-1;
                                });
                              }),
                            SizedBox(width: 10,),
                            RoundButton(
                                icon:Icon(Icons.add,size:32,),
                                callback: () {
                                  setState(() {
                                    weight=weight+1;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard( child:  Column(
                    children: <Widget>[
                      Text('Age',style: kLabelTextStyle,),
                      Text('$age',style: kNumberLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          RoundButton(
                              icon:Icon(Icons.remove,size:32,),
                            callback: () {
                              setState(() {
                                age = age - 1;
                              });
                            } ),
                          SizedBox(width: 10,),
                          RoundButton(
                              icon:Icon(Icons.add,size:32,),
                              callback: () {
                                setState(() {
                                  age = age + 1;
                                });
                              } )
                        ],
                      )
                    ],
                  ),),

                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 64,
            child: FlatButton(

              color: Color(0XFFEB1555),
              onPressed: () {
                 Data data = Data();
                 data.height=height;
                 data.weight=weight;
              Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultPage(data:data,)));
              },
              child: Text(
                "Calculate Your BMI",style: TextStyle(color: Colors.white,fontSize: 21),
              ),
            ),
          )
        ],
      ),
    );
  }
}




