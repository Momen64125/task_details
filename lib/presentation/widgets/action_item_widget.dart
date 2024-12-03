import 'package:flutter/material.dart';
import 'package:untitled5/config/theme/widget_manager.dart';
import 'package:untitled5/presentation/widgets/status_widget.dart';

import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';



class ActionItemWidget extends StatelessWidget {
  const ActionItemWidget({
    super.key,
    this.onTap,
    required this.action,
    this.showFullData = false,
    required this.status,
  });

  final bool showFullData;
  final Function()? onTap;
  final String action;
  final String status;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size8),
      ),
      child: ListTile(
              dense: true,
              onTap: onTap,
              leading: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    action == 'Answer now'
                        ? Icons.edit_note_outlined
                        : action == 'Take a Photo'
                        ? Icons.photo_outlined
                        : Icons.check_box_outlined,
                  ),
                  Text(

                    '$action',
                    style: StylesManager.bold(
                      fontSize: AppFonts.font.large,
                      textOverflow: showFullData ? null : TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: Sizes.size4*6,
                horizontal: Sizes.size16,
              ),
             trailing:StatusWidget(status: 'in progress'),


             ),
    ).paddingAll(Sizes.size10);


   }
}
