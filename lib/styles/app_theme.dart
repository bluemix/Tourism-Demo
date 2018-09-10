import 'package:flutter/material.dart';
import 'package:tourism_demo/styles/app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    final originalTextTheme = ThemeData.light().textTheme;
    final IconThemeData originalIconTheme = ThemeData.light().iconTheme;
    final TextStyle originalBody1 = originalTextTheme.body1;
    var grayNurseColor =
        new Color(0xFFEAE9E7); // <color name="gray_nurse">#EAE9E7</color>
    var lightGrayColor =
        new Color(0xFFD6D6D6); // <color name="light_gray">#D6D6D6</color>
    return ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: Colors.orangeAccent,
        secondaryHeaderColor: AppColors.slateGrayColor,
        indicatorColor: Colors.yellow,
        accentColor: Colors.orangeAccent,
        buttonColor: Colors.white10,
        hintColor: grayNurseColor,
        textSelectionColor: Colors.cyan[100],
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: AppColors.solitudeColor,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.orangeAccent),
          hintStyle: TextStyle(color: lightGrayColor),
          // border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow, style: BorderStyle.none)),
          border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red, style: BorderStyle.none)),
        ),
        iconTheme: originalIconTheme.copyWith(
            color: AppColors.linkWaterColor, size: 18.0),
        textTheme: originalTextTheme.copyWith(
            title: originalBody1.copyWith(
                fontFamily: 'BJ Regular',
                color: AppColors.whiteColor,
                fontWeight: FontWeight.normal),
            subhead: originalBody1.copyWith(
                fontFamily: 'BJ Regular',
                color: AppColors.whiteColor,
                fontSize: 16.5),
            button: originalBody1.copyWith(
                fontFamily: 'BJ Bold',
                color: AppColors.koromikoColor,
                fontSize: 17.0,
                fontWeight: FontWeight.normal),
            display1: originalBody1.copyWith(
                fontFamily: 'BJ Regular',
                color: AppColors.whiteColor,
                fontSize: 24.0),
            body1: originalBody1.copyWith(
              fontFamily: 'BJ Regular',
              fontSize: 17.0,
              color: AppColors.whiteColor,
            ),
            body2: originalBody1.copyWith(
              fontFamily: 'BJ Regular',
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: AppColors.whiteLinen,
            )));
  }
}
