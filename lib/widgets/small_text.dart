// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';

import 'package:flutter_application_1/utils/colors.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  
  SmallText({
    super.key,
    this.color = AppColors.mainSubtitleColor,
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
