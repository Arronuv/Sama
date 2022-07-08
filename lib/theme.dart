import 'package:flutter/material.dart';

class AppTheme{

  Color white=Colors.white;


  TextStyle getLightTextStyle(double size,Color color) {
    TextStyle textStyle = TextStyle(
      fontFamily: 'Rubik',
      fontSize: size,
      fontWeight: FontWeight.w100,
      color: color
    );
    return textStyle;
  }

  TextStyle getRegularTextStyle(double size,Color color) {
    TextStyle textStyle = TextStyle(
      fontFamily: 'Rubik',
      fontSize: size,
      fontWeight: FontWeight.w200,
      color: color
    );
    return textStyle;
  }

  TextStyle getMediumTextStyle(double size,Color color) {
    TextStyle textStyle = TextStyle(
      fontFamily: 'Rubik',
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: color,
    );
    return textStyle;
  }

  TextStyle getBoldTextStyle(double size,Color color) {
    TextStyle textStyle = TextStyle(
      fontFamily: 'Rubik',
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    );
    return textStyle;
  }


}