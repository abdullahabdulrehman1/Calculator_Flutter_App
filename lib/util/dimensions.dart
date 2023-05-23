import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
//HEIGHT RESPONISIVE FUNCTION!!!!!!!!!!!!!!!!!!!
  static double h10 = screenHeight / 10;
  static double h20 = screenHeight / 20;
  static double h30 = screenHeight / 30;
  static double h45 = screenHeight / 45;
  static double h28 = screenHeight / 28;
/////////////////////////////////////////////////
//WIDTH RESPONSIVE ADJUSTMENT!!!!!!!!!!!!!!!!!!!!

  static double w15 = screenHeight / 15;
  static double w40 = screenHeight / 40;

/////////////////////////////////////////////////
//FONT RESPONSIVE ADJUSTMENT!!!!!!!!!!!!!!!!!!!!
  static double f10 = screenHeight / 10;
  static double f14 = screenHeight / 14;
  static double f16 = screenHeight / 16;
  static double f26 = screenHeight / 26;
  static double f20 = screenHeight / 20;
  static double f24 = screenHeight / 24;
  // static double f26 = screenHeight / 26;

/////////////////////////////////////////////////
//ICONSIZE RESPONSIVE ADJUSTMENT!!!!!!!!!!!!!!!!!!!!

  static double i24 = screenHeight / 24;
  static double i16 = screenHeight / 16;

/////////////////////////////////////////////////

  static double pageView = screenHeight / 2.16;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageTextContainer = screenHeight / 7.03;
  //height
  static double height10 = screenHeight / 84.4;
  // static double height10 = screenHeight / ;

  static double height15 = screenHeight / h10;
  static double height20 = screenHeight / h20;
  static double height30 = screenHeight / h30;
  static double height45 = screenHeight / h45;
  //font20
  static double font10 = screenHeight / f10;
  static double font14 = screenHeight / f14;
  static double font16 = screenHeight / f16;
  static double font20 = screenHeight / f20;
  static double font24 = screenHeight / f24;
  static double font26 = screenHeight / f26;
  //radius
  static double radius20 = screenHeight / f20;
  static double radius30 = screenHeight / h30;
  static double radius28 = screenHeight / h28;

//width for padding and margin

  //temp static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / w15;
  static double width20 = screenHeight / h20;
  static double width30 = screenHeight / h30;
  static double width40 = screenHeight / w40;
  static double width45 = screenHeight / h45;

  //iconsize
  static double iconsize24 = screenHeight / i24;
  static double iconsize16 = screenHeight / i16;
  //List view size  390 width
  static double listViewImagesize = screenWidth / 3.25;
  static double listViewTextContsize = screenWidth / 3.9;
  //Popular Food
  static double popularfoodcover = screenHeight / 2.41;
  //Bottom Height;
  static double bottomheightbar = screenHeight / 7.03;
}
