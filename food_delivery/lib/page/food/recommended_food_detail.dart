import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // pour avoir une meilleur netette par rapport au premier texte
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20), 
              child: Container(
                child: Center(child: BigText(size: Dimensions.font26, text: "Chinese")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              ),
              
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,  
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice,then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice,then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice"),
                )
              ],
            ),
          )
        ],
      ),
    
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove
                ),
                BigText(text: "\$12.88 "+" X "+" 0 ", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add
                ), 
              ],
            ),
          ),

          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  )
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
        ],
      ),
    );
  }
}