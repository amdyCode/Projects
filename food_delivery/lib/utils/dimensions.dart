import 'package:get/get.dart';

// height 866.2857142857143 width 411.42857142857144

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.70;
  static double pageViewContainer = screenHeight/3.94;
  static double pageViewTextContainer = screenHeight/7.21;

  // dynamic height padding and margin
  static double height10 = screenHeight/86.6;
  static double height15 = screenHeight/57.73;
  static double height20 = screenHeight/43.3;
  static double height30 = screenHeight/28.86;
  static double height45 = screenHeight/19.24;

  // dynamic width padding and margin
  static double width10 = screenHeight/86.6;
  static double width15 = screenHeight/57.73;
  static double width20 = screenHeight/43.3;
  static double width30 = screenHeight/28.86;

  // font size
  static double font16 = screenHeight/54.14;
  static double font20 = screenHeight/43.3;
  static double font26 = screenHeight/33.30;

  // radius
  static double radius15 = screenHeight/57.73;
  static double radius20 = screenHeight/43.3;
  static double radius30 = screenHeight/28.86;

  // icon Size
  static double iconSize24 = screenHeight/36.083;
  static double iconSize16 = screenHeight/54.125;

  // list view size
  static double listViewImgSize = screenWidth/3.425;
  static double listViewTextContSize = screenHeight/4.11;

  // popular food
  static double popularFoodImgSize = screenHeight/2.88;

  // bottom height 
  static double bottomHeightBar = screenHeight/6.7;
}