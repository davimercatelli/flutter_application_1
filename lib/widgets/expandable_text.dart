import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({
    super.key,
    required this.text
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  // 'late' variables are initialized after 'text' variable is set
  late String firstHalf;
  late String secondHalf;
  
  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/5.63;

  // Check text lenght
  @override
  void initState() {
    super.initState();
    // Check if the 'text' is greater than textHeight limiter
    // firsHalf start from 0 and stop in the textHeight limit
    // secondHalf start +1 from textHeight limit until end
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    } else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // if the 'text' is too small, all text is showed on firstHalf
      child: secondHalf.isEmpty?SmallText(height: 1.8, text: firstHalf):Column(
        children: [
          SmallText(size: Dimensions.font18, height: 1.8, text: hiddenText?("$firstHalf..."):(firstHalf+secondHalf)),
          // When clic on 'Show more', set/reset the state
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
                }
              );
            },
        
            // 'Show more' button
            child: Row(
              children: [
                SmallText(size: Dimensions.font18, text: "Show more", color: AppColors.mainShowMoreColor ),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainShowMoreColor,),
              ],
            ),
          
            
          )
        ],
      ),

    );
  }
}