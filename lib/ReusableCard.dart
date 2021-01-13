import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final  Color color;
  final Widget cardChildWidget;
  final Function onPress;
  ReusableCard({@required this.color,this.cardChildWidget,this.onPress});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress ,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChildWidget,
      ),
    );
  }
}