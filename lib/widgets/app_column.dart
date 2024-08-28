import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,
        ),

        // Vertical space
        SizedBox(height: Dimensions.height5),

        // Ranking and types
        Row(
          children: [
            // 5 start icons
            Wrap(
                children: List.generate(
                    5,
                    (index) => const Icon(Icons.star,
                        color: AppColors.mainKnappColor, size: 15))),

            // Space
            SizedBox(width: Dimensions.height20),

            // Ranking
            SmallText(text: "4.5"),

            // Space
            SizedBox(width: Dimensions.height20),

            // Specification
            SmallText(text: "Order types"),

            // Space
            SizedBox(width: Dimensions.height20),

            // Specification
            SmallText(text: "12N"),
          ],
        ),

        // Vertical space
        SizedBox(height: Dimensions.height15),

        // Type, Location and time
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ranking
            IconTextWidget(
                icon: Icons.circle_notifications,
                text: "Normal",
                color: AppColors.mainSubtitleColor,
                iconColor: AppColors.iconColor0),

            // Distance
            IconTextWidget(
                icon: Icons.location_on,
                text: "1.7 km",
                color: AppColors.mainSubtitleColor,
                iconColor: AppColors.iconColor1),

            // Time
            IconTextWidget(
                icon: Icons.timer,
                text: "12 min",
                color: AppColors.mainSubtitleColor,
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
