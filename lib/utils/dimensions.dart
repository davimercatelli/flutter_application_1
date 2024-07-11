import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // Dynamic panel sizes
  static double pageViewFront = screenHeight/2.64;
  static double pageViewContainer = screenHeight/3.70;
  static double pageViewTextContainer = screenHeight/7.03;

  // Dynamic height
  static double height5 = screenHeight/168.80;
  static double height10 = screenHeight/84.40;
  static double height15 = screenHeight/56.27;
  static double height20 = screenHeight/42.20;
  static double height30 = screenHeight/28.14;
  static double height45 = screenHeight/18.75;

  // Dynamic width
  static double width5 = screenWidth/168.80;
  static double width10 = screenWidth/84.40;
  static double width15 = screenWidth/56.27;
  static double width20 = screenWidth/42.20;
  static double width30 = screenWidth/28.14;
  static double width45 = screenWidth/18.75;

  // Dynamic font size
  static double font15 = screenHeight/76.26;
  static double font20 = screenHeight/42.20;

  // Rounder borders
  static double radius15 = screenHeight/56.27;
  static double radius20 = screenHeight/42.20;
  static double radius30 = screenHeight/28.30;

  // Icon size
  static double iconSize24 = screenHeight/35.17;

  // List view size
  static double listViewImgSize = screenWidth/3.75;
  static double listViewTextSize = screenWidth/4.40;
}

