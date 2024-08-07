import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';


class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png")
                )
              ),
            )
          ),

          // icon widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )
          ),

          // introduce food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2)
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Chinese Side", size: Dimensions.font26),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce", size: Dimensions.font26),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice,then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice"
                      )
                    )
                  )
                ],
              ),
            )
          )
        
        // expandable text widget
        
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2),
                  const Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: BigText(text: "\$ 0.08 Add to cart", color: Colors.white,),
            ),
          

          ],
        ),
      ),
    );
  }
}