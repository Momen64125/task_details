import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';

class StatusWidget extends StatelessWidget {
  final String? status;
  const StatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {


    return  Container(
            height: Sizes.size24,
            width: Sizes.size100,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size2,
              horizontal: Sizes.size10,
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/in_progress.svg',
                  height: Sizes.size12,
                  width: Sizes.size12,
                  // colorFilter: ColorFilter.mode(
                  //  // AppColors.colors.filterSelected,
                  //   //BlendMode.srcIn,
                  // ),
                ),
                 //Sizes.size2.horizontalSpace,
                FittedBox(
                  child: Text(
                   'in progress',
                    style: StylesManager.bold(
                      height: 1,
                      fontSize: AppFonts.font.small,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),


              ],
            ),
          );

  }
}
