import 'package:flutter/material.dart';

import 'package:untitled5/config/theme/widget_manager.dart';
import 'package:untitled5/presentation/widgets/voice_widget.dart';

import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';
import 'action_item_widget.dart';
import 'answer_widget.dart';
import 'chek_if_ok_widget.dart';
import 'file_widget.dart';
import 'image_widget.dart';

class ActionList extends StatelessWidget {
  final int scheduleId;
  final List actionList;
  final String status;

  const ActionList({
    required this.status,
    super.key,
    required this.scheduleId,
    required this.actionList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Tasks',
            style: StylesManager.bold(fontSize: AppFonts.font.large),
          ).paddingOnly(top: Sizes.size10, bottom: Sizes.size10).paddingAll(Sizes.size10),


          ListView.builder(
            shrinkWrap: true,
            itemCount: actionList.length,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
            itemBuilder: (context, index) {
              final actionItem = actionList[index];
              return ActionItemWidget(
                status: status,
                action: actionItem,
                onTap: () async {

                  await showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (ctx) {

                     return Wrap(
                      children: [
                      if (index == 0)
                       ImageWidget(actionItem: actionItem)

                      else if (index == 1)
                       const    AnswerWidget(

                         question: 'Answer the question immediately',
                         options: ['Choice one', 'Choice two', 'Choice three', 'Choice four'],
                       )
                        else if (index == 2)
                       const CheckIfOk(
                      question: 'Check it now if you finish it',
                         optionText: 'Check now',
    )   else
                         FileWidget(actionType:  actionItem, scheduleId: scheduleId),

    ],
    );
                    }






                      // إذا كنت بحاجة لإظهار ActionDetailsWidget، يمكنك إلغاء تعليق السطر التالي
                      // return ActionDetailsWidget(
                      //   status: status,
                      //   action: actionItem,
                      //   scheduleId: scheduleId,
                      // );



                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
