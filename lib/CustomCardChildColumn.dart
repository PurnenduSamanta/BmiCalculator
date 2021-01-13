import 'package:flutter/material.dart';
class CustomCardChildColumn extends StatelessWidget {
  final String text;
  final IconData icon;
  CustomCardChildColumn({@required this.text,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Icon(icon,
              size: constraints.maxHeight*.4,
            ),
            SizedBox(
              height: constraints.maxHeight*.1,
            ),
            Text(text,
              style: TextStyle(
                  color: Color(0xFF88D8E98),
                  fontSize: constraints.maxHeight*.1),
            ),
          ],
        );
      },
    );
  }
}
