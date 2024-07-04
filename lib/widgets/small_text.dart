import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  
  SmallText({super.key, 
    this.color = const Color.fromARGB(255, 128, 124, 105),
    required this.text,
    this.size=12,
    this.height=1.2,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}