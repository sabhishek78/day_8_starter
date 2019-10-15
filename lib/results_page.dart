

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        centerTitle: true,
      ),
          body: Column(
            children:[
            Text("Your Result"),
            Card(
                margin: EdgeInsets.all(20),
             child: Column(
                children: <Widget>[
                  Text("Normal"),
                  Text("Your Result"),
                  Text("Your Result"),
                  Text("Your Result"),
                  Text("Your Result"),
                  Text("Your Result"),
                ],
              )


                 ),
         ] )

    );
  }
}