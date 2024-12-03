import 'dart:ui';
import 'color_system_base.dart';

class ColorSystemDark extends ColorSystemBase {
  @override
  Color get primaryColor => const Color(0xFFFFFFFF);

  @override
  Color get secondaryColor => const Color(0xFFA9C4FF);

  // still
  @override
  Color get appBarColor => const Color(0xff272626);

  // still
  @override
  Color get scaffoldBackgroundColor => const Color(0xff141414);

  @override
  Color get blueCardGradient => const Color(0xFF0A22A8);

  @override
  Color get redCardGradient => const Color(0xFFD32929);

  @override
  Color get emptyPercentIndicator => Color(0xFF393F67);

  @override
  Color get blackColor => Color(0xffffffff);

  @override
  Color get whiteColor => Color(0xff272626);

  @override
  Color get successColor => Color(0xff00af54);

  @override
  Color get warningColor => Color(0xffFFC106);

  @override
  Color get errorColor => Color(0xffe3022c);

  @override
  Color get strokeColor => Color(0xff6795e8);

  @override
  Color get divider => Color(0xffF3F3F3);

  @override
  Color get filterSelected => Color(0xffE5F4FF);

  @override
  Color get filterUnSelected => Color(0xffA9C4FF);
}
