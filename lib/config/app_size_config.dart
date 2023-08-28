import 'package:flutter/cupertino.dart';

class AppSizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double _screenHeight;
  static late double _screenWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenHeight = _mediaQueryData.size.height;
    _screenWidth = _mediaQueryData.size.width;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = AppSizeConfig._screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = AppSizeConfig._screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}