import 'font_system/app_fonts.dart';
import 'package:flutter/widgets.dart';

//TextStyle builder method
TextStyle _getTextStyle({
  double? fontSize,
  String? fontFamily,
  Color? color,
  FontWeight? fontWeight,
  TextOverflow? textOverflow,
  TextDecoration decoration = TextDecoration.none,
  Color? decorationColor,
  double? height,
}) {
  return TextStyle(
    color: color,
    height: height,
    letterSpacing: 0,
    fontSize: fontSize,
    decoration: decoration,
    fontWeight: fontWeight,
    overflow: textOverflow,
    fontFamily: fontFamily,
    decorationColor: decorationColor,
  );
}

/// Regular TextStyle = FontWeight.w400
class StylesManager {
  ///regular TextStyle = [FontWeight.w400],[FontWeight.normal]
  static TextStyle regular({
    double fontSize = 10,
    Color? color,
    Color? decorationColor,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    TextOverflow? textOverflow,
  }) {
    return _getTextStyle(
      fontSize: fontSize,
      fontFamily: AppFonts.font.fontName,
      color: color,
      height: height,
      decorationColor: decorationColor,
      decoration: decoration,
      textOverflow: textOverflow,
      fontWeight: AppFonts.font.regularWeight,
    );
  }

  /// Medium TextStyle = FontWeight.w500
  static TextStyle medium({
    double fontSize = 10,
    Color? color,
    Color? decorationColor,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
    double? height,
  }) {
    return _getTextStyle(
      fontSize: fontSize,
      fontFamily: AppFonts.font.fontName,
      decoration: decoration,
      decorationColor: decorationColor,
      color: color,
      textOverflow: textOverflow,
      fontWeight: AppFonts.font.mediumWeight,
      height: height,
    );
  }

  /// Bold TextStyle = FontWeight.w700
  static TextStyle bold({
    double fontSize = 10,
    Color? color,
    double? height,
    Color? decorationColor,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      height: height,
      fontSize: fontSize,
      fontFamily: AppFonts.font.fontName,
      decoration: decoration,
      decorationColor: decorationColor,
      color: color,
      textOverflow: textOverflow,
      fontWeight: AppFonts.font.boldWeight,
    );
  }

  /// Light TextStyle = FontWeight.w300
  static TextStyle light({
    Color? color,
    double fontSize = 10,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      fontSize: fontSize,
      color: color,
      decoration: decoration,
      textOverflow: textOverflow,
      fontFamily: AppFonts.font.fontName,
      fontWeight: AppFonts.font.lightWeight,
    );
  }

  /// SemiBold TextStyle = FontWeight.w600
  static TextStyle semiBold({
    Color? color,
    double? height,
    double fontSize = 10,
    Color? decorationColor,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      height: height,
      fontSize: fontSize,
      fontFamily: AppFonts.font.fontName,
      decoration: decoration,
      decorationColor: decorationColor,
      color: color,
      fontWeight: AppFonts.font.semiBoldWeight,
    );
  }

  /// ExtraBold TextStyle = FontWeight.w800
  static TextStyle extraBold(
      {double fontSize = 10,
      Color? color,
      TextDecoration decoration = TextDecoration.none}) {
    return _getTextStyle(
      fontSize: fontSize,
      fontFamily: AppFonts.font.fontName,
      decoration: decoration,
      color: color,
      fontWeight: AppFonts.font.extraBoldWeight,
    );
  }

  /// Black TextStyle = FontWeight.w900
  static TextStyle black(
      {double fontSize = 10,
      Color? color,
      TextDecoration decoration = TextDecoration.none}) {
    return _getTextStyle(
      fontSize: fontSize,
      decoration: decoration,
      fontFamily: AppFonts.font.fontName,
      color: color,
      fontWeight: AppFonts.font.blackWeight,
    );
  }

// Thin TextStyle
  static TextStyle thin(
      {double fontSize = 10,
      Color? color,
      TextDecoration decoration = TextDecoration.none}) {
    return _getTextStyle(
      fontSize: fontSize,
      decoration: decoration,
      fontFamily: AppFonts.font.fontName,
      color: color,
      fontWeight: AppFonts.font.extraBoldWeight,
    );
  }
}
