
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled5/config/theme/widget_manager.dart';

import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';

class SumbitActionSuccsufl extends StatelessWidget {
  const SumbitActionSuccsufl({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.values.first,
      children: [
        SvgPicture.asset(
          'assets/images/successful submit.svg',
          width: MediaQuery.sizeOf(context).width * 0.4,
        ),
        Text(
          'Tasks Accomplishment',
          style: StylesManager.bold(fontSize: AppFonts.font.large),
        ).paddingOnly(top: Sizes.size10),
        const SizedBox(height: Sizes.size10),
        Text(
          'Lorem ipsum dolor sit amet consecteturEget elit porta massa commodo elementum sollicitudin amet a massa. Arcu velit etpulvinar lacus urna sem tortor egestas ',
          style: StylesManager.regular(fontSize: AppFonts.font.medium),
        ).paddingOnly(right: Sizes.size40, left: Sizes.size40),
        const SizedBox(height: Sizes.size10),
     Padding(
      padding: const EdgeInsets.all(Sizes.size20),
      child: Container(
       width: double.infinity,
       height:  Sizes.size48,

        decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size8),
        color: Colors.blueAccent,
       ) ,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ok')),
          // ElevatedButton(onPressed: (){
          //   AppRouter.router.pop();
          // },
          // child: Text('ok'))
        ),
    ),
      ],
    );
  }
}
