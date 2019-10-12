import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{male,female}
class _InputPageState extends State<InputPage> {
  Gender gender;
  double _sliderValue=120.0;
 // int gender; // Male = 0, Female = 1
  Color activeCardColor =  Color(0xFF1D1F31);
  Color inactiveCardColor =  Color(0xFF111328);
  @override
  Widget build(BuildContext context) {

    Color backgroundColorMale = inactiveCardColor;
    Color backgroundColorFemale = inactiveCardColor;
/*
    if (gender == 0) {
      backgroundColorMale = activeCardColor;
    } else if (gender == 1) {
      backgroundColorFemale = activeCardColor;
    }
*/
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
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    color: gender==Gender.male ?activeCardColor:inactiveCardColor,
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    color: gender==Gender.female ? activeCardColor:inactiveCardColor,
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
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20,color: Colors.white60),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Text(
                          '${_sliderValue.roundToDouble()}',
                          style: TextStyle(fontSize: 40,color: Colors.white,fontWeight:FontWeight.bold)
                          ,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(fontSize: 08,color: Colors.white,),
                        )],
                    ),
                  ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.blue,
                          inactiveTrackColor: Colors.black,
                          trackHeight: 3.0,
                          thumbColor: Colors.pinkAccent[100],
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),

                        ),
                        child: Slider(min: 110, max:210,value: _sliderValue, onChanged:(newRating) {
                          setState(() => _sliderValue = newRating);
                        },),
                      )


                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function tapCallback;

  ReusableCard(
      {this.color = const Color(0xFF1D1F31), this.child, this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}