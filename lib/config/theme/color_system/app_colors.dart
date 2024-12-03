import 'color_system_base.dart';
import 'color_system_dark.dart';
import 'color_system_light.dart';
import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  // Avoid self instance
  AppColors._();
  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  static ColorSystemBase get colors {
    return i._colors;
  }

  late ThemeMode _themeMode;
  set themeMode(ThemeMode mode) => _themeMode = mode;

  ColorSystemBase get _colors {
    switch (_themeMode) {
      case ThemeMode.dark:
        return ColorSystemDark();
      default:
        return ColorSystemLight();
    }
  }
}

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.value, shades);
}
