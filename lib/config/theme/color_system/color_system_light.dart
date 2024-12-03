import 'dart:ui';
import 'color_system_base.dart';

class ColorSystemLight extends ColorSystemBase {
  @override
  Color get primaryColor => const Color(0xFF292929);

  @override
  Color get secondaryColor => Color(0xFF7C7C7C);

  @override
  Color get appBarColor => const Color(0xFFF1F1F1);

  @override
  Color get scaffoldBackgroundColor => const Color(0xfffafafa);

  @override
  Color get blueCardGradient => const Color(0xFF1D42FF);

  @override
  Color get redCardGradient => const Color(0xFFE94A4A);

  @override
  Color get emptyPercentIndicator => Color(0xFFDCDCDC);

  @override
  Color get whiteColor => const Color(0xffFFFAF3);

  @override
  Color get blackColor => const Color(0xff000000);

  @override
  Color get successColor => const Color(0xff00af54);

  @override
  Color get warningColor => const Color(0xffFFC106);

  @override
  Color get errorColor => const Color(0xffe3022c);

  @override
  Color get strokeColor => const Color(0xff6795e8);

  @override
  Color get divider => const Color(0xffF3F3F3);

  @override
  Color get filterSelected => Color(0xffE5F4FF);

  @override
  Color get filterUnSelected => Color(0xffA9C4FF);
}
