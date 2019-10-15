
import 'input_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ResultPage extends StatelessWidget{
  final Data data;
  ResultPage({this.data});
  String bmiCalculation()
  {
    double bmi;
    bmi=(data.weight.toDouble()*10000)/(pow(data.height.toDouble(),2));
    return bmi.toStringAsFixed(2);
  }

  String bmiClassification(){
    double bmi=double.parse(bmiCalculation());
    if(bmi<18.5)
      {
        return 'Underweight';
      }
    else if(bmi>=18.5 && bmi<24.9)
      {
        return "Normal";
      }
    else if(bmi>=24.9 && bmi<29.9)
    {
      return "Overweight";
    }
    else if(bmi>=29.9 )
    {
      return "Obese";
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        centerTitle: true,
      ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            Text("Your Result",style: TextStyle(color: Colors.white,fontSize: 30),),
            Expanded(
              child: Card(
                  margin: EdgeInsets.all(20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("${bmiClassification()}",style: TextStyle(color: Colors.green,fontSize: 21),),
                    Text("${bmiCalculation()}",style: TextStyle(color: Colors.white,fontSize: 100),),
                    Text("Normal BMI Range",style: TextStyle(color: Colors.grey,fontSize: 21),),
                    Text("18,5-25 kg/m2",style: TextStyle(color: Colors.white,fontSize: 21),),
                    Text("You have  ${bmiClassification()} body weight.",style: TextStyle(color: Colors.white,fontSize: 21),),
                    Container(
                      width: 150,
                      height: 50,
                      child: FlatButton(

                        color: Colors.grey,
                        onPressed: () {
                         // Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultPage()));
                        },
                        child: Text(
                          "Save Result",style: TextStyle(color: Colors.white,fontSize: 21),
                        ),
                      ),
                    )
                  ],
                )


                   ),
            ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton(

                  color: Color(0XFFEB1555),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> InputPage()));
                  },
                  child: Text(
                    "Re-Calculate Your BMI",style: TextStyle(color: Colors.white,fontSize: 21),
                  ),
                ),
              )
         ] )

    );
  }
}