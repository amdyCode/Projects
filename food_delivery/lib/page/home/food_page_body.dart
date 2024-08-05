import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    //super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section

        Container(
          // color: Colors.redAccent
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder:(context, position) {
              return _BuildPageItem(position);
            },
          ),
        ),
        
        // dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      
        // Popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
      
        // list of food and images
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food0.png"),
                      )
                    ),
                  ),

                  Expanded(
                    child: Container(
                      // height: Dimensions.listViewTextContSize, probleme espace
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20)
                        ),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Nutritious fruit and meal in China"),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: "With chinese characteristics"),
                            SizedBox(height: Dimensions.height10),
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
                        ),
                      ),
                    )
                  )
                ],
              ),
            );
          }
        ),
      
      //     ListView.builder(
      //       physics: const NeverScrollableScrollPhysics(),
      //       shrinkWrap: true,
      //       itemCount: 10,
      //       itemBuilder: (context, index){
      //         return Container(
      //           margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
      //           child: Row(
      //             children: [
      //               // image section
      //               Container(
      //                 width: Dimensions.listViewImgSize,
      //                 height: Dimensions.listViewImgSize,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(Dimensions.radius20),
      //                   color: Colors.white38,
      //                   image: const DecorationImage(
      //                     fit: BoxFit.cover,
      //                     image: AssetImage("assets/image/food0.png"), 
      //                   )
      //                 ),
      //               ),
      //               // text container
      //               Expanded(
      //                 child: Container(
      //                   height: Dimensions.listViewTextContSize,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.only(
      //                       topRight: Radius.circular(Dimensions.radius20),
      //                       bottomRight: Radius.circular(Dimensions.radius20)
      //                     ),
      //                     color: Colors.white
      //                   ),
      //                   child: Padding(
      //                     padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         BigText(text: "Nutritious fruit and meal in China"),
      //                         SizedBox(height: Dimensions.height10),
      //                         SmallText(text: "With chinese characteristics"),
      //                         SizedBox(height: Dimensions.height10),
      //                         const Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             IconAndTextWidget(
      //                               icon: Icons.circle_sharp, 
      //                               text: "Normal", 
      //                               iconColor: AppColors.iconColor1,
      //                             ),
      //                             IconAndTextWidget(
      //                               icon: Icons.location_on, 
      //                               text: "1.7km", 
      //                               iconColor: AppColors.mainColor,
      //                             ),
      //                             IconAndTextWidget(
      //                               icon: Icons.access_time_outlined, 
      //                               text: "32 min", 
      //                               iconColor: AppColors.iconColor2,
      //                             )
      //                           ],
      //                         )
                
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );
      //     }
      //   )
      ]
    );
  }
  Widget _BuildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currentPageValue.floor()+1){
      var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currentPageValue.floor()-1){
      var currScale = 1 - (_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale= 0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover, // utilise comme couverture a la boite
                image: AssetImage("assets/image/food0.png"),
              )
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5)
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0)
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0)
                )

              ]
            ),
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15),
              child: AppColumn(text: "Chinese Side")
            ),
          ),
        ),
        
        ]
      ),
    );
  }
}