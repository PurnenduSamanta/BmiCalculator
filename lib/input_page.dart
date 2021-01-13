import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomCardChildColumn.dart';
import 'ReusableCard.dart';
import 'Calculation.dart';
const bottomContainerHeight=60.0;
const activeCardColor=Color(0xFF1D1E33);
const inactiveCardColor=Color(0xFF111328);
enum Gender{male,female}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;
  Gender selectGender;
  int height=180;
  int weight=60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:  Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          Expanded(child: 
          Row(
            children:<Widget> [
              Expanded(
                child: ReusableCard(
                  onPress:()
                  {
                    setState(() {
                      selectGender=Gender.male;
                    });
                  },
                  color: selectGender==Gender.male?activeCardColor:inactiveCardColor,
              cardChildWidget:CustomCardChildColumn(text:'Male',icon: FontAwesomeIcons.mars),
              ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress:(){
                    setState(() {
                      selectGender=Gender.female;
                    });
                  },
                  color: selectGender==Gender.female?activeCardColor:inactiveCardColor,
                cardChildWidget:CustomCardChildColumn(text:'Female',icon: FontAwesomeIcons.venus),
              ),
              ),
            ],
          ),
          ),
          Expanded(
            child:  LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
                    return ReusableCard(
                      color: activeCardColor,
                      cardChildWidget: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:<Widget> [
                          Text('Height',
                            textAlign: TextAlign.center,
                            style:TextStyle(
                              fontSize:constraints.maxHeight*.09,
                              color:Color(0xFF88D8E98),
                            ),
                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            textBaseline:TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children:<Widget> [
                              Text(height.toString(),
                                style: TextStyle(
                                  fontSize: constraints.maxHeight*.25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text('cm',
                                style: TextStyle(
                                  fontSize: constraints.maxHeight*.08,
                                  color:Color(0xFF88D8E98),
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                overlayShape:RoundSliderOverlayShape(
                                  overlayRadius: constraints.maxHeight*.1,
                                ),
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius:  constraints.maxHeight*.08,
                                )
                            ),
                            child: Slider(
                                min: 120,
                                max: 220,
                                activeColor:Color(0xFFEB1555),
                                inactiveColor:Color(0xFF8D8E98),
                                value: height.toDouble(),
                                onChanged: (double newValue){
                                  setState(() {
                                    height=newValue.round();
                                  });
                                }
                            ),
                          )
                        ],
                      ),

                    );
                    }


            ),
          ),
          Expanded(child: Row(
            children:<Widget> [
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints)
                  {
                    return  ReusableCard(
                      color: activeCardColor,
                      cardChildWidget: weightCustomCard(constraints),
                    );
                  }
                ),
              ),
              Expanded(
                child:  LayoutBuilder(
                 builder: (BuildContext context, BoxConstraints constraints) {
                   return ReusableCard(
                     color: activeCardColor,
                     cardChildWidget: ageCustomCard(constraints),
                   );
                 }
                ),
              ),
            ],
          ),
          ),
          GestureDetector(
            onTap:(){
              Calculation cal=Calculation(height: height, weight: weight);
              String bmi=cal.getBMI();
              String result=cal.getResult();
              String conclusion=cal.getConclusion();
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Result(bmi:bmi,result: result,conclusion: conclusion)));

            },
             child: Container(
                child: Center(
                  child: Text('Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:25,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                height: bottomContainerHeight,
                color: Color(0xFFEB1555)
              ),
            ),
        ],
      ) ,
      );
  }

  Column weightCustomCard(BoxConstraints constraints) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text('Weight',
                  style: TextStyle(
                    fontSize:constraints.maxHeight*.08,
                    color:Color(0xFF88D8E98)
                  ),
                  ),
                  Text(weight.toString(),
                  style: TextStyle(
                    fontSize: constraints.maxHeight*.2,
                    fontWeight: FontWeight.w900
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                    Container(
                      width: constraints.maxHeight*.25,
                      height: constraints.maxHeight*.25,
                      child: FloatingActionButton(
                      //  heroTag: 'joy',
                          elevation: 8,
                        backgroundColor: Color(0xFF4C4F5E),
                          child: Icon(FontAwesomeIcons.minus,color: Colors.white),
                          onPressed:(){
                          setState(() {
                            weight=weight>1?weight=weight-1:1;
                          });

                          }
                      ),
                    ),
                      SizedBox(width: constraints.maxHeight*.05),
                      Container(
                        width: constraints.maxHeight*.25,
                        height: constraints.maxHeight*.25,
                        child: FloatingActionButton(
                            heroTag: 'joy1',
                            elevation: 8,
                            child: Icon(FontAwesomeIcons.plus,color: Colors.white),
                          backgroundColor: Color(0xFF4C4F5E),
                            onPressed:(){
                              setState(() {
                                weight=weight<500?weight=weight+1:500;
                              });
                        }),
                      )
                    ],
                  ),
                ],
              );
  }

  Column ageCustomCard(BoxConstraints constraints) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children:<Widget> [
             Text('Age',
             style: TextStyle(
             fontSize:constraints.maxHeight*.08,
            color:Color(0xFF88D8E98)
            ),
            ),
            Text(age.toString(),
            style: TextStyle(
            fontSize: constraints.maxHeight*.2,
            fontWeight: FontWeight.w900),
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
            Container(
              width: constraints.maxHeight*.25,
              height: constraints.maxHeight*.25,
              child: FloatingActionButton(
                  heroTag: "btn1",
               elevation: 8,
              backgroundColor: Color(0xFF4C4F5E),
              child: Icon(FontAwesomeIcons.minus,color: Colors.white),
              onPressed:(){
                setState(() {
                age=age>1?age=age-1:1;
               });
              }
              ),
            ),
            SizedBox(width: constraints.maxHeight*.05),
            Container(
              width: constraints.maxHeight*.25,
              height: constraints.maxHeight*.25,
              child: FloatingActionButton(
                  heroTag: "btn2",
              elevation: 8,
              child: Icon(FontAwesomeIcons.plus,color: Colors.white),
              backgroundColor: Color(0xFF4C4F5E),
              onPressed:(){
               setState(() {
               age=age<120?age=age+1:120;
                });
               }),
            )
            ],
            ),
            ],
            );
  }
}


