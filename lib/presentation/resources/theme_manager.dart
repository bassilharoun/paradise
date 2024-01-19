import 'package:avanced_course/presentation/resources/color_manager.dart';
import 'package:avanced_course/presentation/resources/font_manager.dart';
import 'package:avanced_course/presentation/resources/styles_manager.dart';
import 'package:avanced_course/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    // cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.darkPrimary,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.darkPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    // elevated ButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    //text theme
    textTheme: TextTheme(
        displayLarge: getLightStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: ColorManager.mediumPrimary, fontSize: FontSize.s14),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),
        bodySmall: getRegularStyle(color: ColorManager.grey2)),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey2, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.grey2, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
