//
// import 'package:untitled5/config/theme/widget_manager.dart';
//
//
// import '../../config/theme/sizes_manager.dart';
// import 'action_item_widget.dart';
//
// import 'package:flutter/material.dart';
//
// class ActionDetailsWidget extends StatelessWidget {
//   final String status;
//   final int scheduleId;
//   final String action;
//   const ActionDetailsWidget({
//     required this.status,
//     super.key,
//     required this.action,
//     required this.scheduleId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: MediaQuery.of(context).viewInsets,
//       child: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ActionItemWidget(
//                 status: status,
//                 action: action,
//                 showFullData: true,
//               ),
//               // ? Action Note
//               // ActionNoteWidget(ActionId: action.id),
//               // // ? Actions Items
//               // getActionType(
//               //   action: action,
//               //   scheduleId: scheduleId,
//               // ).paddingOnly(bottom: Sizes.size10),
//             ],
//           ).paddingSymmetric(horizontal: Sizes.size10),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:untitled5/config/theme/widget_manager.dart';
import '../../config/theme/sizes_manager.dart';
import 'action_item_widget.dart';

class ActionDetailsWidget extends StatelessWidget {
  final String status;
  final int scheduleId;
  final String action;

  const ActionDetailsWidget({
    required this.status,
    required this.action,
    required this.scheduleId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,  // لتحديد المساحة التي يشغلها العنصر
            crossAxisAlignment: CrossAxisAlignment.stretch, // محاذاة المحتوى
            children: [
              ActionItemWidget(
                status: status,
                action: action,
                showFullData: true,  // عند الحاجة لعرض بيانات كاملة
              ),
              // يمكنك إضافة المزيد من العناصر هنا مثل ActionNoteWidget أو غيرها
              // مثال:
              // ActionNoteWidget(actionId: action.id),
            ],
          ).paddingSymmetric(horizontal: Sizes.size10),  // إضافة المسافات المناسبة على الجانبين
        ),
      ),
    );
  }
}
