import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double size;
  const AppColumn({
    super.key, required this.text,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: size==0?Dimensions.font20:size),
          SizedBox(height: Dimensions.height10),
            // comments section
            Row(
              children: [
                Wrap(
                  children: List.generate(5, (index) {
                  return Icon(Icons.star, color: AppColors.mainColor, size: Dimensions.iconSize16);
                  }),
                ),
                SizedBox(width: Dimensions.width10),
                SmallText(text: "4.5"),
                SizedBox(width: Dimensions.width10),
                SmallText(text: "1287"),
                SizedBox(width: Dimensions.width10),
                SmallText(text: "Comments"),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            // time and distance
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconAndTextWidget(
                  icon: Icons.circle_sharp, 
                  text: "Normal", 
                  iconColor: AppColors.iconColor1,
                ),
                IconAndTextWidget(
                  icon: Icons.location_on, 
                  text: "1.7km", 
                  iconColor: AppColors.mainColor,
                ),
                IconAndTextWidget(
                  icon: Icons.access_time_outlined, 
                  text: "32 min", 
                  iconColor: AppColors.iconColor2,
                )
              ],
            )
      ],
    );
  }
}