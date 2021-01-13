import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
class Result extends StatelessWidget {
  final String bmi,result,conclusion;
  Result({@required this.bmi,@required this.result,@required this.conclusion});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('BMI CALCULATOR'),
      ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         Expanded(
             child: LayoutBuilder(
             builder: (BuildContext context, BoxConstraints constraints) {
              return  Container(
                margin: EdgeInsets.only(top:constraints.maxHeight*.4),
                child: Text('Your Result',textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: constraints.maxHeight*.5,
                      fontWeight: FontWeight.bold
                  ),
                ),
              );
             }
             )
         ),
         Expanded(
           flex: 5,
             child: LayoutBuilder(
             builder: (BuildContext context, BoxConstraints constraints) {
              return  ReusableCard(
                color: activeCardColor,
                cardChildWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Text(result.toUpperCase(),style: TextStyle(color: Colors.green,fontSize:constraints.maxHeight*.04,fontWeight: FontWeight.bold ),
                    ),
                    Text(bmi,
                      style: TextStyle(
                          fontSize: constraints.maxHeight*.18,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(conclusion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: constraints.maxHeight*.04
                      ),
                    )
                  ],
                ),
              );
              }

             )),
         GestureDetector(
           onTap:(){
             Navigator.pop(context);
           } ,
           child: Container(
             child: Center(
               child: Text('Re-calculate',style: TextStyle(
                   fontSize:25,
                   fontWeight: FontWeight.bold
               ),),
             ),
             width: double.infinity,
             margin: EdgeInsets.only(top: 10),
             height: bottomContainerHeight,
             color: Color(0xFFEB1555),
           ),
         ),
       ],
     )
    );
  }
}
